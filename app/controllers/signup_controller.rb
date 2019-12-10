class SignupController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    params[:birthday] = birthday_join
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:password] = user_params[:password]
    session[:email] = user_params[:email]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = params[:birthday]
    @user = User.new(user_params)
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(user_params)
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number], 
      birthday: session[:birthday] ,
    )
    if @user.save
    # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to root_path
    else
      render '/signup/step1'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password,
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :phone_number,
      :birthday,
      address_attributes: [:id, :zip_code, :prefecture, :city, :block, :building]
  )
  end

  def birthday_join
    # パラメータ取得
    date = params[:birthday]

    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

  end
  

end

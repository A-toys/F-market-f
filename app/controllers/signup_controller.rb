class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3 # step2のバリデーション
  before_action :validates_step3, only: :step4
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
    @user = User.new
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end

  def step4
    session[:zip_code] = user_params[:address_attributes][:zip_code]
    session[:prefecture_id] = user_params[:address_attributes][:prefecture_id]
    session[:city] = user_params[:address_attributes][:city]
    session[:block] = user_params[:address_attributes][:block]
    session[:building] = user_params[:address_attributes][:building]
    @user = User.new
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

    @user.build_address(
      zip_code: session[:zip_code], # sessionに保存された値をインスタンスに渡す
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block], 
      building: session[:building],
    )

    if @user.save
    # ログインするための情報を保管
      session[:user_id] = @user.id
      redirect_to done_signup_index_path
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
      address_attributes: [:zip_code, :prefecture_id, :city, :block, :building]
  )
  end

  def validates_step1
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = params[:birthday]
    
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
      birthday: "1900-01-01"
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
      render '/signup/step1' unless @user.valid?(:validates_step1)
  end

  def validates_step2
    # step1で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
      phone_number: session[:phone_number],
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
      render '/signup/step2' unless @user.valid?(:validates_step2)
  end

  def validates_step3
    # step1で入力された値をsessionに保存
    session[:zip_code] = user_params[:address_attributes][:zip_code]
    session[:prefecture_id] = user_params[:address_attributes][:prefecture_id]
    session[:city] = user_params[:address_attributes][:city]
    session[:block] = user_params[:address_attributes][:block]
    session[:building] = user_params[:address_attributes][:building]
    
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
      phone_number: session[:phone_number],
    )
    @user.build_address(
      zip_code: session[:zip_code], # sessionに保存された値をインスタンスに渡す
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block], 
      building: session[:building],
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
      render '/signup/step3' unless @user.valid?(:validates_step3)
  end
  
  def birthday_join
    # パラメータ取得
    date = params[:birthday]

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

  end
  

end

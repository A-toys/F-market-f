class SignupController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

end

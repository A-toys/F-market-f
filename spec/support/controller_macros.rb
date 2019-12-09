# テスト中でlogin機能(devise)を使用できるようにする
module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end
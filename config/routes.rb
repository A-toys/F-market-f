Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'items#index'
  get '/mypage', to: 'items#mypage'
end

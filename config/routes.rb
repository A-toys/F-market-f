Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get '/mypage', to: 'items#mypage'
  get '/card', to: 'items#card'
end

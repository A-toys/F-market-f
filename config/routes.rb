Rails.application.routes.draw do
  root to: 'items#index'
  get '/mypage', to: 'items#mypage'
end

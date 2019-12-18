Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'items#index'

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end

  resources :items do
    member do
      get "mydetails"
      
    end
  end
  get '/mypage', to: 'items#mypage'
  get '/registration', to: 'items#registration'
  get '/login', to: 'items#login'

  get '/card', to: 'items#card'

end

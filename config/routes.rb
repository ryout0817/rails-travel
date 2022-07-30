Rails.application.routes.draw do
  get 'rooms/index'
  # rootで最初のページになるtop/indexを使わなくて良い
  root to: "tops#index"
  
  # トップアクションの基本7つがルーティングされる  
  resources :tops
  resources :rooms
  # devise_forはログイン周りに必要なものを準備するヘルパーメソッド
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  
    #アカウントアクションを使う際に必要なルーティング、今回は制作途中で作ったもの
    resources :tops do
      member do
        get 'acount'
      end
    end
    
    
  end

  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

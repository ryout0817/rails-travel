Rails.application.routes.draw do
  # rootで最初のページになるtop/indexを使わなくて良い
  root to: "tops#index"
  
  # トップアクションの基本7つがルーティングされる  
  resources :tops, only: [:index]
  resources :rooms, only: [:index, :create, :new, :show]
  post '/reservations/new(.:format)'
  resources :accounts, only: [:show, :update, :edit]
  resources :reservations
  # devise_forはログイン周りに必要なものを準備するヘルパーメソッド
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

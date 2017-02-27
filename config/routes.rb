Rails.application.routes.draw do
  root "trades#index"
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  resources :trades
  resources :services
    resources :jobs, except: :index
    resources :reviews, only: [:show, :new, :destroy]

end

Rails.application.routes.draw do
  root "trades#index"
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  resources :trades do
    resources :jobs, except: :index
  end

  resources :jobs, only: :show do
      resources :reviews, only: [:show, :new, :create]
  end
end

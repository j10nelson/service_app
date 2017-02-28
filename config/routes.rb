Rails.application.routes.draw do
  root "trades#index"
  resources :users, only: [:new, :create, :index, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  resources :trades, only: :index do
    resources :jobs, except: :index
  end

  resources :jobs, except: :index do
      resources :reviews, only: [:show, :new, :create]
  end
end

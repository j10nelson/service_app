Rails.application.routes.draw do
  root "jobs#index"
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  resources :users do
    resources :jobs do
      resources :reviews, only: [:show, :new, :destroy]
    end
  end
end

Rails.application.routes.draw do
  root "jobs#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users do
    resources :jobs do
      resources :reviews, only: [:show, :new, :destroy]
    end
  end
end

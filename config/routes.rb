Rails.application.routes.draw
  root "jobs#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end

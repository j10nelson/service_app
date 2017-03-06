Rails.application.routes.draw do

  root "services#index"
  resources :users, only: [:new, :create, :index, :show, :update]
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :services, only: [:index, :create, :new] do
    resources :jobs, except: :index

  end

  put '/jobs/:id/accept' => "jobs#accept", :as => :job_accept

  resources :jobs, except: [:index, :edit] do
      resources :reviews, only: [:show, :new, :create]
  end
end

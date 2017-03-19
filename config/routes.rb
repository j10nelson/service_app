Rails.application.routes.draw do
  root "services#index"
  resources :users, only: [:new, :create, :show, :update]
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  resources :services, only: [:index, :create, :new]
  resources :addresses, only: [:new, :create, :edit]
  resources :submissions, only: [:new, :create]

  resources :trades, only: [:index, :new, :create] do
    resources :jobs, except: :index
  end

  get '/trades/:trade_id/jobs' => "jobs#new"
  get '/user_sessions' => 'user_sessions#new'
  get '/users' => "users#new"

  put '/users/:id/birth' => "users#birth", :as => :worker_birth
  get '/users/:id/worker' => "users#worker", :as => :user_request

  put '/jobs/:id/accept' => "jobs#accept", :as => :job_accept

  resources :jobs, except: [:index, :edit] do
      resources :reviews, only: [:show, :new, :create]
  end
end

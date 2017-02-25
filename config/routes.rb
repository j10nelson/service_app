Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only: [:new,]
  resources :jobs do
    resources :reviews, only: [:new, :show]
  end
end

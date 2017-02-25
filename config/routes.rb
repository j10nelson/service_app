Rails.application.routes.draw do
  get 'users/show'

  get 'users/create'

  get 'users/edit'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :jobs do
    resources :reviews
  end
end

Rails.application.routes.draw do
  resources :users
  resources :tasks
  resources :statuses
  resources :user_tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

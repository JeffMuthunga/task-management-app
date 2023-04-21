Rails.application.routes.draw do
  resources :users
  resources :tasks
  resources :statuses
  resources :user_tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/user/:id/tasks', to: "users#usertasks"
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end

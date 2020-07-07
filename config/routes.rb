Rails.application.routes.draw do
  get '/connect', to: 'static_pages#connect'
  get '/notifications', to: 'static_pages#notifications'
  get '/about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'

  resources :likes, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :users

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'comments#index'
  get '/signup/' ,to: 'users#new' 
  get '/login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	
end
Rails.application.routes.draw do
  
  get "/", to: "items#index", as: 'items'
  get "/home", to: "sessions#home", as: 'home'

  get "/login", to: "sessions#new", as: 'login'
  post "/login", to: "sessions#create"

  get '/logout/destroy', to: "sessions#destroy"
  delete '/logout', to: "sessions#destroy", as: 'logout'

  get '/items/shirts', to: 'items#shirts'
  get '/items/pants', to: 'items#pants'
  get '/items/hats', to: 'items#hats'

  delete '/cart_items/:id/delete', to: "cart_items#destroy", as: 'remove'
  get '/cart_items/checkout', to: "cart_items#checkout", as: 'checkout'

  get '/cart_items/reviews/:id/new', to: "reviews#new"
  post '/cart_items/reviews/:id/create', to: "reviews#create"
  get '/history', to: "reviews#history", as: "history"

  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
  
  
  resources :reviews, only: [:new, :create]
  resources :cart_items, only: [:index, :new, :create, :update]
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :passwords, only: [:index, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

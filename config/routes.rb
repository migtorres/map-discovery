Rails.application.routes.draw do
  get "home/index"
  root to: "home#index"
  resources :countries
  resources :users, only: [:new, :create, :edit, :update, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/logout', to: "sessions#destroy"
end

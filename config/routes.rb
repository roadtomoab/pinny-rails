Rails.application.routes.draw do
  resources :reviews
  resources :pins
  resources :users

  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
end

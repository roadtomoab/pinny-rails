Rails.application.routes.draw do
  resources :reviews
  resources :pins
  resources :users

  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/my-pins", to: "pins#my_pins"
end

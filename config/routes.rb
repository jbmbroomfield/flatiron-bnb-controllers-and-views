Rails.application.routes.draw do

  root 'pages#index'

  resources :cities
  resources :listings
  resources :neighborhoods
  resources :reservations
  resources :reviews
  resources :users

end

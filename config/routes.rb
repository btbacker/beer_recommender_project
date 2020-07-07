Rails.application.routes.draw do
  resources :likes
  resources :beers_flavors
  resources :orders
  resources :flights
  resources :users
  resources :flavors 
  resources :beers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items, only: [:index, :new, :show]
  get '/items/new_buy'
end

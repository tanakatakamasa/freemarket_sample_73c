Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :categories
  resources :items do
    member do
      get "new_buy"
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end

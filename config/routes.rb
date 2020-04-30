Rails.application.routes.draw do
  get 'transactions/buy'
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    collection do
      get "confirmation/:id"=>  'items#confirmation', as: "confirmation"
      post 'purchase/:id'=>   'items#purchase', as: "purchase"
      get 'done'=>      'items#done', as: "done"
    end
  end
  resources :cards
end
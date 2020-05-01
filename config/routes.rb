Rails.application.routes.draw do
  get 'transactions/buy'
  devise_for :users
  root 'items#index'
  resources :users
  resources :cards
  resources :items do
    collection do
      get "confirm/:id"=>  'items#confirm', as: "confirm"
      post 'purchase/:id'=>   'items#purchase', as: "purchase"
      get 'done'=>      'items#done', as: "done"
    end
  end
end
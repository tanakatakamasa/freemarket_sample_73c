Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
    collection do
      post 'sign_out', to: 'users#sign_out'
    end

  resources :cards
  resources :items do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  
end
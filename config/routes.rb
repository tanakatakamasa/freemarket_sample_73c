Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

  resources :users, only: [:show] do
    member do
      get 'sign_out', to: 'users#sign_out'
    end
  end

  resources :cards

  resources :items do
    member do
      get 'confirm'
      post 'pay', to: 'items#pay'
      get 'done', to: 'items#done'
    end
  end

  # resources :purchase do
  #   member do
  #     post 'confirm'
  #   end
  #   collection do
  #     post 'pay', to: 'purchase#pay'
  #     get 'done', to: 'purchase#done'
  #   end
  # end
  
end
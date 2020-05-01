Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  # resources :items
  #   resources :transactions

  # resources :cards do
  #   member do
  #     get "confirm"
  #     post "purchase"
  #     get "done"
  #   end
  # end

  resources :items do
    resources :purchase, only: [:index] do
      # おそらくcollectionを使うのは、payもdoneもitemsのparamsが不要だから
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  
end
Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :cards
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
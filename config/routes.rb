Rails.application.routes.draw do
  root 'items#show'
  resources :items
end

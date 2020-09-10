Rails.application.routes.draw do
  devise_for :user
  root to: 'items#index'
  resources :users, only: [:create]
  resources :items
  get 'items/:price', to: 'items#checked'
end

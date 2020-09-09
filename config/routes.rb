Rails.application.routes.draw do
  devise_for :user
  root to: 'items#index'
  resources :users, only: [:create]
  resources :items, only: [:index, :new, :create, :show]
  get 'items/:price', to: 'items#checked'
end

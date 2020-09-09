Rails.application.routes.draw do
  # get 'users/new'
  # post 'items/new'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:create]
  resources :items, only: [:new, :create,]
  # get 'items/:price', to: 'items#checked'
end

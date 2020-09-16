Rails.application.routes.draw do
  devise_for :user
  root to: 'items#index'
  resources :users, only: [:create]
  resources :items do
    resources :orders, only:[:index, :create, :new]
  end
  get 'items/:price', to: 'items#checked'
end

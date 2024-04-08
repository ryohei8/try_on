Rails.application.routes.draw do
  get 'try_on_for_client/index'

  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :stores, only: [:index, :new, :create, :edit, :update, :destroy]
end

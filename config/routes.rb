Rails.application.routes.draw do
  root to: 'items#index'
  resources :items, only: [:index, :create, :edit, :update]
end

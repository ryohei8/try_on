Rails.application.routes.draw do
  devise_for :users
  get 'tryonforclient/index'
  get '/search', to: 'tryonforclient#search'
  post '/search', to: 'tryonforclient#search'


  root to: 'items#index'
  resources :stores, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end

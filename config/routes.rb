Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  get 'tryonforclient/index'
  post '/search', to: 'tryonforclient#search'


  resources :stores, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  # ひとまず全体の検索ができるか検討するため冗長を許容
  resources :items, only: [:index]
end

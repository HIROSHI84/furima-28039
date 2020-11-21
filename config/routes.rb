Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  
  root 'items#index'
  #resources :users

  
  # root to: 'items#index'
  # resources :items, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'articles#index'
  # resources :articles
end

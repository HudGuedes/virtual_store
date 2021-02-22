Rails.application.routes.draw do
  root to: 'site#index'
  get 'search', to: 'site#search'
  resources :categories, only: [:show]
  resources :products, only: [:show]
  namespace :admin do
    resources :products
    resources :categories
    devise_for :users
  end

end

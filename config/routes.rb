Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  resources :users, only: [:index, :edit]
  resources :credit_cards, only: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

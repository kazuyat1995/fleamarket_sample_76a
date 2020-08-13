Rails.application.routes.draw do
  get 'credit_cards/new'
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :edit]
  get 'credit_cards/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

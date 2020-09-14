Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'address', to: 'users/registrations#new_address'
    post 'address', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  
  resources :items, only: [:show, :new, :create] do
    member do
      get 'confirm'
    end
  end

  resources :users, only: [:index, :edit]
  resources :credit_cards, only: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

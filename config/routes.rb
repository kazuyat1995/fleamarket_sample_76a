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

  resources :cards, only: [:new, :create, :show] do
    collection do
      get 'finished'
      post 'delete'
    end
    member do
      post 'payment'
    end
  end
  
  resources :items do
    member do
      get 'confirm'
    end
    collection do
      get 'get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:index, :edit, :show] do
    member do
      get 'sold_lists'
      get 'display_lists'
      get 'confirm_deletion'
      get 'confirm_edit'
      post 'confirm_edit'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

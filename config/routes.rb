Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
    devise_scope :user do
      get 'addresses', to: 'users/registrations#new_address'
      post 'addresses', to: 'users/registrations#create_address'
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  root to: 'items#index'

  resources :items
  resources :images do
    member do
      get 'show_image'
    end
  end
  resources :users, only: [:show]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

end


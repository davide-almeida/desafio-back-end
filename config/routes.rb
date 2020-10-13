Rails.application.routes.draw do

  get 'users', to: 'panel/users#index'

  namespace :panel do
    get 'dashboard', to: 'dashboard#index'
    get 'transaction_rules', to: 'transaction_rules#index'
    resources :users, except: [:show]
    resources :drops, except: [:edit, :update, :show]
    resources :stores, only: [:index, :show, :destroy] do
      resources :transactions, only: [:index, :destroy]
    end
  end

  devise_for :users#, :skip => [:registrations]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'panel/dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

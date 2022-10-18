# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  namespace :host do
    resources :listings
  end

  resources :listings

  # User profile
  get '/profile/:id', to: 'profiles#show', as: 'profile'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

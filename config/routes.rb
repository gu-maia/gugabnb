Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  namespace :host do
    resources :listings
  end

  resources :listings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

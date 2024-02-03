# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  resources :products, only: %i[index show]
  resources :cart_products, only: %i[index create destroy] do
    collection do
      patch 'coupon', to: 'cart_products#coupon'
      resources :checkouts, only: %i[create]
    end
  end

  resources :order_details, only: %i[index show]
  namespace :admin do
    resources :products
  end
end

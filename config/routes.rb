# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'
  }

  root to: 'home#index'
  get 'home/form'
  resources :vigencia_uds
  resources :presupuesto_conceptos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

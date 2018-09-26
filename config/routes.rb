# frozen_string_literal: true

Rails.application.routes.draw do
  get 'leaves/index'
  devise_for :users

  root 'home#index'

  resources :admin
  resources :leaves
end

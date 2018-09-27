# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :admin
  resources :leaves
  # get 'leaves/new', to: 'leaves#new', as: 'new_leave'
  # get 'leaves/:id', to: 'leaves#show', as: 'leave'
  # post 'leaves', to: 'leaves#create'
end

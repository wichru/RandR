# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :users, :except => [:new]

  root 'home#index'

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :leaves
    resources :users
  end

  resources :leaves
  # get 'leaves/:id/edit', to: 'leaves#edit', as: :edit_leave
  # patch 'articles/:id', to: 'articles#update'
  # get 'leaves/new', to: 'leaves#new', as: 'new_leave'
  # get 'leaves/:id', to: 'leaves#show', as: 'leave'
  # post 'leaves', to: 'leaves#create'
end

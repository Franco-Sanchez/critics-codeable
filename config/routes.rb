# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#index'

  devise_for :users

  resources :games, only: %i[index show new create] do
    resources :critics, only: %i[new create edit update]
    resources :involved_companies, only: %i[new create]
  end

  resources :companies, only: %i[new create]

  get '/games/:game_id/add_genre/new', to: 'games#add_genre_new', as: 'game_add_genre_new'
  post '/games/:game_id/add_genre', to: 'games#add_genre', as: 'game_add_genre'

  get '/games/:game_id/add_platform/new', to: 'games#add_platform_new', as: 'game_add_platform_new'
  post '/games/:game_id/add_platform', to: 'games#add_platform', as: 'game_add_platform'

  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end
end

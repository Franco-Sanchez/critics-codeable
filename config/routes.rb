# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#index'

  devise_for :users

  resources :games do
    resources :critics
    resources :involved_companies, only: %i[new create destroy]
  end

  resources :companies, only: %i[new create]

  get '/games/:game_id/add-genre/new', to: 'games#add_genre_new', as: 'new_game_add_genre'
  post '/games/:game_id/add-genre', to: 'games#add_genre', as: 'game_add_genres'
  delete '/games/:game_id/remove-genre/:genre_id', to: 'games#remove_genre', as: 'game_remove_genre'

  get '/games/:game_id/add-platform/new', to: 'games#add_platform_new', as: 'new_game_add_platform'
  post '/games/:game_id/add-platform', to: 'games#add_platform', as: 'game_add_platforms'
  delete '/games/:game_id/remove-platform/:platform_id', to: 'games#remove_platform', as: 'game_remove_platform'

  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end
end

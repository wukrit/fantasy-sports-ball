Rails.application.routes.draw do

  get '/players/clear', to: 'players#clear', as: 'clear'

  get '/rosters/player_search', to: 'rosters#player_search', as: 'player_search'
  get '/rosters/search_clear', to: 'rosters#search_clear', as: 'search_clear'
  get 'rosters/add_player', to: 'rosters#add_player', as: 'add_player'

  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :rosters, except: [:index]
  resources :users

  get '/login', to: 'login#form', as: 'login'
  post '/login', to: 'login#auth', as: 'login_auth'
  get '/logout', to: 'login#logout', as: 'logout'

  root "static#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

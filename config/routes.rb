Rails.application.routes.draw do

  root "static#home"

  get '/players/clear', to: 'players#clear', as: 'clear'

  get '/rosters/player_search', to: 'rosters#player_search', as: 'player_search'
  get '/rosters/search_clear', to: 'rosters#search_clear', as: 'search_clear'
  get '/rosters/add_player', to: 'rosters#add_player', as: 'add_player'

  get '/trades/process_trade', to: 'trades#process_trade', as: 'process_trade'

  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :rosters, except: [:index]
  resources :users
  resources :trades, only: [:new, :create, :destroy]

  get '/login', to: 'login#form', as: 'login'
  post '/login', to: 'login#auth', as: 'login_auth'
  get '/logout', to: 'login#logout', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

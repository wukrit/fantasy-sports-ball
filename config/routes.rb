Rails.application.routes.draw do
  resources :teams
  resources :players
  resources :rosters
  resources :roster_players
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

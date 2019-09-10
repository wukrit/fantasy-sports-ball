Rails.application.routes.draw do
  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :rosters, except: [:index]
  resources :users

  get '/login', to: 'login#form', as: 'login_path'
  post '/login', to: 'login#auth', as: 'login_auth_path'
  get '/logout', to: 'login#logout', as: 'logout_path'

  root "static#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

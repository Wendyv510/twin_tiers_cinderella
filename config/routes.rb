Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#home' 


  get '/createaccount' => "users#new"
  get '/login' => "sessions#new" 
  post '/login' => "sessions#create"
  get '/auth/facebook/callback' => "sessions#fbcreate"

  get '/auth/github/callback' => "sessions#ghcreate"
  get '/logout' => "sessions#destroy" 

  resources 'users'
  resources 'teams'
  resources 'players'

  post 'teams/new' => "teams#new"
  post 'players/new' => "players#new" 
  post 'players/:id/edit' => "players#edit" 
  post 'user/user_id/teams' 

  resources :users, only: [:show, :index] do 
    resources :teams, only: [:show, :index, :new, :create] 
  end 

  resources :teams do 
    resources :players, only: [:index, :new, :show, :create] 
  end 

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#home' 

  get '/login' => "sessions#new" 
  get '/auth/facebook/callback' => 'sessions#create' 
  post '/login' => "sessions#create" 
  post '/logout' => "sessions#destroy" 

  resources 'users'
  resources 'teams'
  
  resources 'players' 

end

Rails.application.routes.draw do

  
  # removed the following in lieu of JWT auth
  # get "/users", to: "users#check_user_pass"
  # get "/check_user", to: "users#check_user"
  
  get "/leaderboard", to: "users#leaderboard"
  get "/test", to: "users#test"
  resources :user_games, only: [:create]
  resources :games, only: [:create]
  resources :songs, only: [:index]
  post "/get_songs", to: "songs#get_songs"
  resources :users, only: [:create, :update, :index]
  post "/login", to: "users#login"
  patch "/update_user_games", to: "user_games#update_user_games"
  patch "/update_users", to: "users#update_users"

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end

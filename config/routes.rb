Rails.application.routes.draw do
  devise_for :users

  resources :games, only: [:index, :new, :create]

  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'

end

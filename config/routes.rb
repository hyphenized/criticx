Rails.application.routes.draw do
  resources :companies, :games
  # Routes for users
  resources :users, only: [:new, :create]

  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

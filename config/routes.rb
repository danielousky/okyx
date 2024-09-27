Rails.application.routes.draw do
  resources :areas
  resources :services

  devise_for :users, controllers: { sessions: 'sessions' }

  get 'dashboard/index', as: 'session_dashboard'
  get 'inicio/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inicio#index"
end

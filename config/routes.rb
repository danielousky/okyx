Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  get 'inicio/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inicio#index"
end

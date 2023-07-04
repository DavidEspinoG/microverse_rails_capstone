Rails.application.routes.draw do
  root "home#index"
  resources :categories, only: [:index, :new, :create]
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root to: 'home#index'
end

Rails.application.routes.draw do
  get 'games/new'
  post 'games/score'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :games_controller
end

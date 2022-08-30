Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :nonprofits, only: [:index, :show]

  get "/nonprofits/goods", to: "nonprofits#goods"
  get "/nonprofits/volunteer", to: "nonprofits#volunteer"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :nonprofits, only: [:show] do
    collection do
      get :goods
      get :volunteer
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

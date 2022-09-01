Rails.application.routes.draw do
  get 'donations/new'
  devise_for :users
  root to: "pages#home"

  resources :nonprofits, only: [:show] do
    collection do
      get :goods
      get :volunteer
    end
    resources :donations, only: [:new, :create]
  end

  get "my_account", to: "pages#my_account"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

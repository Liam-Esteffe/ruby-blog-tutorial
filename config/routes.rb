Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
  end
  get '*unmatched_route', to: 'application#raise_not_found'

  # Defines the root path route ("/")
  # root "articles#index"
end

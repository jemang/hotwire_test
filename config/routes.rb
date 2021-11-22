Rails.application.routes.draw do
  resources :items do
    resources :likes, only: :create
    resources :unlikes, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  root 'items#index'
end

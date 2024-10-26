Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :carts, only: [:show] do
    post 'add_item', on: :member  # Route for adding items to the cart
    delete 'remove_item', on: :member  # Route for removing items from the cart
  end
  root "products#index"
  resources :products
end

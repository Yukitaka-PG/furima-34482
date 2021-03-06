Rails.application.routes.draw do
  devise_for :users
  # get 'products/index'
  root to: "products#index"
  resources :products do
    resources :cards, only: [:index, :create]
  end
end
Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

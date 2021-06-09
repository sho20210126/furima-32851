Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :purchase_managements, only: [ :index, :create ]
  resources :users, only: :show
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

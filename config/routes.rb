Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :destroy] 
  resources :rooms, only: [:index, :new, :create, :show, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end
end

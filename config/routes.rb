Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:index, :create, :destroy]
  resources :friendships, only: [:index, :create, :destroy]
  get 'friends' => 'friendships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

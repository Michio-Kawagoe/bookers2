Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:new, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

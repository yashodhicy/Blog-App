Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:new,:create,:show ]
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end
  root 'users#index'
end

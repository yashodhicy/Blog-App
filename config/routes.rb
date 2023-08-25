Rails.application.routes.draw do
  
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:new,:create,:show ]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
  root 'users#index'
end

Rails.application.routes.draw do
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:new,:create,:show ]
  end
  root 'users#index'
end

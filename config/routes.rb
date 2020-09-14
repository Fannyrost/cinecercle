Rails.application.routes.draw do
  devise_for :users

  get '/wall', to: 'pages#wall', as: 'wall'

  resources :circles, only: [ :index, :show ] do
    resources :recommendations, only: [ :show ]
    resources :movies, only: [:index, :show]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

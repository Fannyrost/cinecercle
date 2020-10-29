Rails.application.routes.draw do

  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/wall', to: 'pages#wall', as: 'wall'
  resources :users, only: [:show]
  resources :circles, only: [ :index, :show, :create ] do

    post 'movies/movie', to: 'movies#movie'
    get 'movies/movie', to: 'movies#movie'
    resources :memberships, only: [:create]
    patch 'memberships/quit', to: 'memberships#deactivate', as: 'deactivate_membership'
    resources :recommendations, only: [ :show ] do
      resources :watchlists, only: [:create]
      resources :reviews, only: [:create]
    end
     resources :movies, only: [:index]  do
      resources :recommendations, only: [ :new, :create]
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

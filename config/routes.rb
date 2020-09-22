Rails.application.routes.draw do

  devise_for :users

  get '/wall', to: 'pages#wall', as: 'wall'

  resources :circles, only: [ :index, :show, :create ] do

    post 'movies/movie', to: 'movies#movie'
    get 'movies/movie', to: 'movies#movie'
    resources :recommendations, only: [ :show ]
     resources :movies, only: [:index]  do
      resources :recommendations, only: [ :new, :create]
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

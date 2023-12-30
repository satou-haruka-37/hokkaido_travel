Rails.application.routes.draw do
  root 'static_pages#top'

  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/terms_of_service', to: 'static_pages#terms_of_service'

  get '/auth/:provider/callback', to: 'auth0#callback'
  get '/auth/failure', to: 'auth0#failure'
  get '/logout', to: 'auth0#logout'

  resources :posts
  resources :distance_calculators, only: [:index]
  resources :movement_methods, only: [:index]

  namespace :mypage do
    get '/', to: 'favorites#index'

    resources :posts, only: [:index]
    resources :favorites, only: [:index]
    resource :settings, only: %i[show update destroy]
  end
end

Rails.application.routes.draw do
  root 'static_pages#top'

  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/terms_of_service', to: 'static_pages#terms_of_service'
  get '/location_trouble', to: 'static_pages#location_trouble'
  get '/auth0_icon', to: 'static_pages#auth0_icon'
  get '/lets_login', to: 'static_pages#lets_login'

  get '/auth/:provider/callback', to: 'auth0#callback'
  get '/auth/failure', to: 'auth0#failure'
  get '/logout', to: 'auth0#logout'

  resources :posts do
    resources :bookmarks, only: %i[create destroy]
    member do
      get 'nearby_posts'
    end
  end
  resources :distance_calculators, only: [:index]
  resources :movement_methods, only: [:index]
  resources :clothing_suggestions, only: [:index]

  namespace :mypage do
    get '/', to: 'favorites#index'

    resources :posts, only: [:index]
    resources :bookmark_posts, only: [:index]
    resource :settings, only: %i[show update destroy]
  end

  get '*unmatched_route', to: 'static_pages#top'
end

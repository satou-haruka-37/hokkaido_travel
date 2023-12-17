Rails.application.routes.draw do
  root 'static_pages#top'

  get '/auth/:provider/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/logout' => 'auth0#logout'
  resources :posts
end

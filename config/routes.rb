Rails.application.routes.draw do
  root 'static_pages#top'

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/logout' => 'auth0#logout'
end

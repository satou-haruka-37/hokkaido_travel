Rails.application.routes.draw do
  root 'static_pages#top'
  resources :posts, only: %i[index]
end

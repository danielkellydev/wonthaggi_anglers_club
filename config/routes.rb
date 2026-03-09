Rails.application.routes.draw do
  # Auth (generated)
  resource :session
  resources :passwords, param: :token

  # Admin namespace
  namespace :admin do
    root "dashboard#index"
    resources :posts
    resources :events
    resources :gallery_images, except: [:show]
  end

  # Public
  resources :posts, only: [:index, :show], param: :slug
  resources :events, only: [:index, :show], param: :slug
  get "gallery", to: "gallery#index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end

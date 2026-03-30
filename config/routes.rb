Rails.application.routes.draw do
  # Auth (generated)
  resource :session
  resources :passwords, param: :token

  # Admin namespace
  namespace :admin do
    root "dashboard#index"
    resource :password, only: [:edit, :update], controller: "password"
    resources :posts
    resources :events
    resources :gallery_images, except: [:show]
    resources :fish_points, except: [:show]
    resources :membership_fees, except: [:show]
    resources :committee_members, except: [:show]
    resources :sponsors, except: [:show]
    resources :about_sections, except: [:show]
    resource :site_settings, only: [:edit, :update] do
      delete :destroy_file, on: :member
    end
  end

  # Public
  resources :posts, only: [:index, :show], param: :slug
  resources :events, only: [:index, :show], param: :slug
  get "gallery", to: "gallery#index"
  get "about", to: "pages#about", as: :about
  get "sponsors", to: "pages#sponsors", as: :sponsors
  get "fish-points", to: "pages#fish_points", as: :fish_points
  get "membership", to: "pages#membership", as: :membership

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end

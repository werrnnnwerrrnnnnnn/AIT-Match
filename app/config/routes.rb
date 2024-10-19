Rails.application.routes.draw do
  devise_for :users#, controllers: { sessions: 'users/sessions' }
  resources :profiles
  # resources :profiles, only: [:new, :create, :edit, :update, :show, :index]
  resources :preferences
  # resources :preferences, only: [:edit, :update]
  resources :students



  # get "profiles/new"
  # get "profiles/create"
  # get "profiles/edit"
  # get "profiles/show"
  # get "profiles/index"
  # get "profiles/delete"
  # get "contact_page/index"
  # get "about_page/index"
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get 'welcome', to: "welcome_page#index"
  get 'about', to: "about_page#index"
  get 'contact', to: "contact_page#index"

  # get 'new_profile',to: "profiles#new"
  # get 'edit_profile',to: "profiles#edit"
  # get 'show_profile',to: "profiles#show"
  # get 'index_profile',to: "profiles#index"
  
  root to: 'welcome_page#index'
end

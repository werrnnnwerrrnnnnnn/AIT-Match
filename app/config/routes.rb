Rails.application.routes.draw do
  # Mount ActionCable server
  mount ActionCable.server => '/cable'

  get "messages/create"
  get "conversations/index"
  get "conversations/show"
  get "conversations/create"
  devise_for :users#, controllers: { sessions: 'users/sessions' }

  resources :reports, only: [:new, :create, :index, :show]

  # Admin namespace for user management
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :reports, only: [:index, :show, :update, :destroy]
  end

  # resources :profiles
  # resources :profiles, only: [:new, :create, :edit, :update, :show, :index]
  resources :preferences
  # resources :preferences, only: [:edit, :update]
  resources :students

  resources :profiles do
    collection do
      get 'search', to: 'profiles#search' 
      get 'show_all', to: 'profiles#show_all'
    end
    resources :matches, only: [:create]
  end

  # Matches routes with custom actions for accepting and declining matches
  resources :matches, only: [:index, :create, :destroy] do
    collection do
      get 'requests', to: 'matches#requests'   # For match requests
      get 'matched_profiles', to: 'matches#matched_profiles'   # For matched profiles
    end
    post 'accept', on: :member  # POST /matches/:id/accept
    post 'decline', on: :member  # POST /matches/:id/decline
  end

  # Route for matched profiles
  get 'matches/matched_profiles', to: 'matches#matched_profiles', as: 'matches_matched_profiles'

  # Route for match requests
  get 'matches/requests', to: 'matches#requests', as: 'matches_requests'

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

  # get 'new_profile', to: "profiles#new"
  # get 'edit_profile', to: "profiles#edit"
  # get 'show_profile', to: "profiles#show"
  # get 'index_profile', to: "profiles#index"

  resources :conversations do
    resources :messages
  end

  # Route for starting a conversation
  post '/conversations/start', to: 'conversations#create', as: 'start_conversation'

  # Route for admins to start conversations
  post '/admin/conversations', to: 'conversations#create', as: 'admin_conversations'

  # Route for matched users to start conversations (passing match_id)
  post '/matches/:match_id/conversations', to: 'conversations#create', as: 'match_conversations'

  root to: 'welcome_page#index'
end
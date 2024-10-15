Rails.application.routes.draw do
  devise_for :users#, controllers: { sessions: 'users/sessions' }
  resources :profiles, only: [:new, :edit, :update, :show]
  resources :students
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get 'welcome', to: "welcome_page#index"
  get 'about', to: "about_page#index"
  get 'contact', to: "contact_page#index"

  get 'new_profile',to: "profiles#new"
  get 'edit_profile',to: "profiles#edit"
  get 'show_profile',to: "profiles#show"
  get 'index_profile',to: "profiles#index"
  
  root to: 'welcome_page#index'
end

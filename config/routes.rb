Rails.application.routes.draw do
  # Portfolio
  namespace :portfolio do
    resources :portfolio_items, only: [:index, :show, :update, :create, :destroy]
    delete 'delete-portfolio-image/:id', to: 'portfolio_item_images#destroy'
    resources :portfolio_app_users
    resources :portfolio_blogs
  end

  # Devworkflow
  namespace :devworkflow do
    resources :check_list_items
    resources :project_line_items, only: [:show, :update]
    resources :devworkflow_projects, only: [:index, :create, :destroy, :update]
    resources :devworkflow_users, only: [:index, :create, :destroy, :update]
    resources :archived_projects, only: [:index, :update]
    resources :unarchive_projects, only: [:update]
    resources :registrations, only: [:create]
    resources :sessions, only: [:create]
    delete :logout, to: 'sessions#logout'
    get :logged_in, to: 'sessions#logged_in'
  end

  # Application
  resources :projects, only: [:index, :show]
  resources :project_tables
  resources :client_domains, only: [:index, :create, :destroy]
  resources :app_templates
  resources :clients
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  get 'get-client-applications', to: 'clients#get_client_applications'
  root to: 'home#index'
end

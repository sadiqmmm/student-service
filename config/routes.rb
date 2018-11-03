Rails.application.routes.draw do
  # Portfolio
  namespace :portfolio do
    resources :portfolio_items, only: [:index, :show, :create, :destroy]
    resources :portfolio_app_users
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

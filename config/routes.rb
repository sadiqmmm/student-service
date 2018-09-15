Rails.application.routes.draw do
  resources :projects, only: [:index, :show]
  resources :portfolio_items
  resources :portfolio_app_users
  resources :app_templates
  resources :clients
  get 'get-client-applications', to: 'clients#get_client_applications'

  root to: 'home#index'
end

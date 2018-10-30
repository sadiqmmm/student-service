Rails.application.routes.draw do
  resources :client_domains, only: [:index]
  resources :projects, only: [:index, :show]
  resources :portfolio_items, only: [:index, :show, :create]
  resources :portfolio_app_users
  resources :app_templates
  resources :clients
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  get 'get-client-applications', to: 'clients#get_client_applications'
  root to: 'home#index'
end

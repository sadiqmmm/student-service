Rails.application.routes.draw do
  resources :portfolio_items
  resources :portfolio_app_users
  resources :app_templates
  resources :clients

  root to: 'home#index'
end

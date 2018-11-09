# DevCamp Student Service

> This API provides an interface for DevCamp students to have authentication and persistence in front end applications.

## Instructions for adding a new project

1.  Create the routes for the project and wrap them in a namespace along with the associated controllers and actions.

```ruby
namespace :devworkflow do
  resources :check_list_items
  resources :project_line_items, only: [:show, :update]
  resources :projects, only: [:index, :create, :destroy, :update]
  resources :archived_projects, only: [:index, :update]
  resources :unarchive_projects, only: [:update]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
end
```

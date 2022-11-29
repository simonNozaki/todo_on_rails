Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :healthchecks, only: [:index]
  put('v1/todos/complete', { to: 'v1/todos#complete' })
  namespace :v1 do
    resources :todos, only: [:create, :update, :destroy, :show]
  end
  # For routing not found
  get '*not_found', to: 'application#handle_routing_error'
end

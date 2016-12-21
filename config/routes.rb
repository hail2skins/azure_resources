require 'api_version'

Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'


  scope defaults: { format: 'json' } do
    namespace :api do
      scope module: :v1, constraints: ApiVersion.new('v1', true) do
        resources :systems
        resources :containers
      end
    end
  end
 
  resources :systems
  resources :containers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

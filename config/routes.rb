Rails.application.routes.draw do
  resources :jobs
  resources :boats
  devise_for :users
  root to: "jobs#index"
  get '/jobs/assign', to: 'jobs#assign'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

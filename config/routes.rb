Rails.application.routes.draw do
  resources :jobs
  resources :boats
  devise_for :users
  root to: "jobs#index"
  post '/jobs/:id', to: 'jobs#remove'
end

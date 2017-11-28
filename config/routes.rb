Rails.application.routes.draw do

  get 'jobs/new'

  get 'jobs/edit'

  get 'jobs/index'

  get 'jobs/show'

  devise_for :users
  root to: "boats#index"
  
  get 'boats/index'

  get 'boats/new'

  get 'boats/edit'

  get 'boats/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

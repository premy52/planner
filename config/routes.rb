Rails.application.routes.draw do

  get 'sessions/new'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

	root "articles#index"

  resources :users
  resources :sessions
  
  resources :articles
  
  resources :clients do
  	resources :publications
  end
  
  resources :super_topics do 
  	resources :topics
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

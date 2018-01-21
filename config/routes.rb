Rails.application.routes.draw do

  root 'sessions#new'

  #error pages
  match '/404', to:'errors#not_found', :via => :all, as: :e_404
  match '/500', to:'errors#internal_server_error', :via => :all, as: :e_500
  match '/401', to:'errors#unauthorized', :via => :all, as: :e_401

  #session
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  #static pages
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'

  #resources
  resources :products
  resources :categories
  resources :users
  resources :taxes
  resources :inventories
  resources :order_details
  resources :customers

  get '/sales', to: 'sales#new'
end

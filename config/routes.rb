Rails.application.routes.draw do

  resources :customers
  match '/404', to:'errors#not_found', :via => :all, as: :e_404
  match '/500', to:'errors#internal_server_error', :via => :all, as: :e_500
  match '/401', to:'errors#unauthorized', :via => :all, as: :e_401

  resources :users
  resources :taxes
  resources :inventories
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete   '/logout',   to: 'sessions#destroy'

  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'

  root 'sessions#new'

  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'properties/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  devise_scope :user do
    post '/guest_login', to: 'sessions#new_guest'
  end
  resources :users
  resources :properties
  resources :rooms
end
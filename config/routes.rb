Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :articles

  get 'contact', to: 'pages#contact', as: 'contact_thing'
  get 'login', to: 'pages#login', as: 'login_thing'
  post 'login', to: 'pages#login_create', as: 'login_thing_create'

end

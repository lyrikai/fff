Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'

  get '/pages/team', to: 'pages#team'
  get '/pages/contact', to: 'pages#contact'
  get 'pages/welcome/:id', to: 'pages#welcome'

  get 'pages/potin/:id', to: 'pages#potin'
  get 'pages/author/:id', to: 'pages#author'

end

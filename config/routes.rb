Rails.application.routes.draw do
  root "static_pages#home"
  get '/static_pages/home', to: 'static_pages#home', as: '/home'
  get '/contact', to: 'static_pages#contact', as: '/contact'
  get '/team', to: 'static_pages#team', as: '/team'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :gossips do
    resources :commentaries, only:[:index,:show,:new,:create]
  end

  resources :users
  resources :cities
  resources :sessions, only:[:new,:create,:destroy]
  get '/sessions/profile', to: 'sessions#profile'
  # Defines the root path route ("/")
  # root "articles#index"
end

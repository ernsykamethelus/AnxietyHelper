Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'


  resources :users, except: [:new]
  resources :posts 
  resources :blogs
  # root 'blogs#index'
  # get 'about', to: 'blogs#about'
end

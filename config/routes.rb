Rails.application.routes.draw do

  match   '/login',   to: 'sessions#login' , as: 'login', via: [:get,:post]
  match   '/two_fa',  to: 'sessions#two_factor_auth' , via: [:get,:post]
  resources :users
    
    get  '/signup',  to: 'users#new'
    get   '/logout', to: 'users#logout', as: 'logout'
    post '/signup',  to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

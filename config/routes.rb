Rails.application.routes.draw do

  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  delete 'users/login' => 'users#logout'

   root 'static_page#home'



  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips
  resources :users




end

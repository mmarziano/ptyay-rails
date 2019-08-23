Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'sessions#new'
  
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  post '/profile' => "users#update"
  
  resources :users
  resources :fundraisers do
    resources :reservations, only: :new
  end 
  resources :reservations
  resources :schools
  resources :households do 
    resources :students, only: :new
  end 
  resources :students
  resources :comments



end
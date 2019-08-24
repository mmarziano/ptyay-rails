Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'sessions#index'
  
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  post '/profile' => "users#complete_update"
  patch '/complete_profile' => "users#complete_profile"
  post '/fundraisers/:fundraiser_id/comments/new' => "comments#create"
  
  
  resources :users
  resources :fundraisers do
    resources :reservations, only: :new
    resources :comments, only: [:new, :create, :edit, :update]
  end 

  resources :comments
  resources :reservations
  resources :schools
  resources :households do 
    resources :students, only: :new
  end 
  resources :students
  resources :classrooms, only: [:index, :new, :create]
  

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

end
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'sessions#index'
  
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  post '/profile' => "users#update"
  
  resources :users
  resources :fundraisers
  resources :schools
  resources :households do 
    resources :students do 
    end
  end 

end
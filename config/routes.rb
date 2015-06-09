Rails.application.routes.draw do

  root 'pages#index'

  get '/login' =>'sessions#new'
  post '/login' =>'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :tweets

end

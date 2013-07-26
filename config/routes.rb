WdiTradr::Application.routes.draw do

  root :to => 'users#index'
  get 'users/refresh_table' => 'users#refresh_table'
  resources :stocks, :only => [:create]

>>>>>>> fa0eda3101b5b9d794bc9323a3120d0c1b72b96e
  resources :user_sessions
  resources :users
  resources :stocks


  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  post 'create_stock' => 'stocks#create', :as => 'create_stocks'

  root :to => 'users#show'
>>>>>>> fa0eda3101b5b9d794bc9323a3120d0c1b72b96e
end

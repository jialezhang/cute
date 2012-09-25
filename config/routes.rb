Cute::Application.routes.draw do


  get "home/index"

  root :to => 'home#index'

  resources :photos
#  resources :blogs
  resources :users
  resources :likes
#  resources :password
  
  

  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create', :as => :login
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  
 get ':name', :controller => 'people', :action => 'show', :as => :person
#put passwords and profile to one directory  
  namespace :settings do
    resource :password, :only => [:show, :update]
    resource :profile, :only => [:show, :update]
  end

end


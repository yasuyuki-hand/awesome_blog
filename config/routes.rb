Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'user/new' -> /singup or /register
  resources :users
  root 'static_pages#home'

  #HTTP ACTION '/route-name', to: 'controller_name#action'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  #New create and destroy for sessions
  resources :sessions, only: [:new, :create, :destroy]

  #Create and destroy for Micropost
  #Create  -> Post button
  #Destroy -> Delete button to delete post
  # Update is not here beacuse in 
  resources :microposts, only: [:create, :destroy]
  resources :microposts do
    member do
      post 'uplike'
    end
  end
  #For follow and unfollow
  resources :relationships, only: [:create, :destroy]

  #/login
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'


  #Follow Stats
  resources :users do
    member do
      get :following, :followers
    end
  end

  # localhost:3000 -> default page/root page
  # localhost:3000/users/1 -> user's page/profile page
  # localhost:3000/users/1/following -> show user 1's following / who is he following?
  # localhost:3000/users/1/followers -> shows user 1's followers / how many followers? who is following him?

  # get 'static_pages/home'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :u_sers
  root 'static#home'
  get '/u_sers/sign_up'
  get 'static/signin'
  delete '/u_sers/sign_out'
  get '/users_path' => 'users#show'
  get '/user' => 'users#index'
  get '/u_sers/password/new'
  get '/newpost' =>'post#new'
  get '/post' => 'post#home'
  post  '/posts' => 'post#create'
  get '/user_path/user/id' => 'users#index'
  get '/user_path/user/:id' => 'users#index'
  get '/user_destroy' => 'users#destroy'
  get '/post_destroy' => 'post#destroy'
  get '/post_edit' => 'post#edit'
  post '/post_update' => 'post#update'
  get '/like_like' => 'likes#like'
  get '/like_unlike' => 'likes#unlike'
  get '/requests' => 'requests#index'
  get '/addfriend' =>'requests#createrequest'
  get 'cancelrequest' => 'requests#cancelrequest'
  get '/accept' => 'requests#acceptrequest'
  get '/feed' => 'static#feed'

  resources :likes
  resources :posts
  resources :comments
as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
end
end

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
  post '/post' => 'post#home'
  post  '/posts' => 'post#create'
get '/user_path/user/id' => 'users#index'
get '/user_path/user/:id' => 'users#index'

  resources :posts
as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
end
end

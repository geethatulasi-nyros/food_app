Rails.application.routes.draw do
  devise_for :admin, path: 'admin',:controllers=>{sessions:"admin/sessions"},path_names:{sign_up: 'register',sign_in: 'login',sign_out: 'logout'}
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, path: 'users', path_names: { sign_up: 'signup', sign_in: 'signin', sign_out: 'signout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dishes#index"
  post 'dishes/search', to: 'dishes#search'
  get 'dishes/autocomplete', to:'dishes#autocomplete'
  resources :users
  resources :dishes do
  	resources :reviews
  end
  namespace :admin do
    root to: 'dashboard#index'
    resources :users
    resources :dishes
    resources :reviews
  end
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end
get '/myrecipes',to: 'users#my_recipes',as: 'myrecipes'
end

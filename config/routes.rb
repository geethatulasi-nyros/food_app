Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'signin', sign_out: 'signout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dishes#index"
  resources :dishes do
  	resources :reviews
  end
end

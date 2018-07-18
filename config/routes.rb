Rails.application.routes.draw do
  get '/shops', to: 'shops#index'
  resources :users

  post '/users/sign_in', to: "users#sign_in"
  # resources :shops, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

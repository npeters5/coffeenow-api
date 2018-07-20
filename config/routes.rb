Rails.application.routes.draw do
  resources :favorites
  
  get '/shops', to: 'shops#index'
  get 'shops/:id/show', to: 'shops#show', as: 'shop'

  resources :users
  post '/users/sign_in', to: "users#sign_in"
end

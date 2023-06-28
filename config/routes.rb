Rails.application.routes.draw do
  resources :users
  resources :films
  resources :people
  resources :planets

  post 'users/authenticate', to: 'users#authenticate', as: 'authenticate_users'
end

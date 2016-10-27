Rails.application.routes.draw do
  root 'apartments#show'

  resources :apartments, only:[:show, :destroy, :edit, :create, :new]
  resources :users
  resources :chores

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end

Rails.application.routes.draw do
  root 'apartments#show'

  resources :apartments, only:[:show, :destroy, :edit, :create, :new]
  resources :users
  resources :chores
end

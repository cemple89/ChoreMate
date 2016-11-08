Rails.application.routes.draw do
  root 'apartments#index'

  resources :apartments, only:[:show, :destroy, :edit, :create, :new]
  resources :users
  resources :chores
end

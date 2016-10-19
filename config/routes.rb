Rails.application.routes.draw do
    
  resources :apartments, only:[:show, :destroy, :edit, :create, :new]
  resources :users
  resources :chores
end

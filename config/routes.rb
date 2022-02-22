Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  patch '/users/update/:id', to: 'users#update', as: 'branch_update'

  resources :inventory_items
end

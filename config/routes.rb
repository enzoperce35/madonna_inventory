Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  patch '/users/update/:id', to: 'users#update', as: 'branch_update'
  patch '/inventory_items/apply_update/:id', to: 'inventory_items#apply_update', as: 'item_update'

  resources :inventory_items
  resources :inventory_updates, except: [:index]
end

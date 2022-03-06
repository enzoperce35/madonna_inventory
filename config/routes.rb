Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  patch '/users/update/:id', to: 'users#update', as: 'branch_update'
  patch '/inventory_items/apply_update/:id', to: 'inventory_items#apply_update', as: 'item_update'
  delete 'home/delete_updates', to: 'home#delete_updates', as: 'delete_updates'
  delete 'home/delete_month', to: 'home#delete_month', as: 'delete_month'

  resources :inventory_items
  resources :inventory_updates
end

Rails.application.routes.draw do
  get 'users/update'
  root 'home#index'
  
  devise_for :users
  
  patch '/users/update/:id', to: 'users#update', as: 'branch_update'
end

Rails.application.routes.draw do
  
 
  devise_for :users
  resources :loans
  root "borrowers#index"
  resources :borrowers 
end

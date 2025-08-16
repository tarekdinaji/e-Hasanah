Rails.application.routes.draw do
  
 
  devise_for :users
  resources :loans
  root "loans#index"
  resources :borrowers 
  resource  :guarantors
  

end

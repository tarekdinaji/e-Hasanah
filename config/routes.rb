Rails.application.routes.draw do
  devise_for :users

  root "loans#index"

  resources :borrowers do
    resource  :guarantor, only: [:new, :create, :show, :edit, :update]
    resources :loans, only: [:index, :new, :create]  
  end

  resources :loans do
    resources :installments, only: [:index, :new, :create]
  end

  resources :installments, only: [:show, :edit, :update]
end

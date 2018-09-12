Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit, :update]
  get 'prototypes/:id/edit' => 'prototypes#edit'
  patch 'prototypes/:id' => 'prototypes#update'
end

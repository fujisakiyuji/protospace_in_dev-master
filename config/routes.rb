Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only:[:create]
  end
  resources :users, only: [:show, :edit, :update]

end

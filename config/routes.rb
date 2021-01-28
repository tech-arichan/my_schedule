Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only:[:edit, :update]
  root to: 'events#index'
  resources :events
  resources :tasks
  resources :storages
  resources :memos, only:[:index, :new, :create, :destroy]
end

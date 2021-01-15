Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:edit, :update]
  root to: 'events#index'
  resources :events
  resources :memos, only:[:index, :create]
end

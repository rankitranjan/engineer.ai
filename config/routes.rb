Rails.application.routes.draw do
  get 'secret_codes', to: 'secret_codes#index'
  post 'secret_codes', to: 'secret_codes#bulk_create'
  devise_for :users
  resources :users
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'welcome/index'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :offers
  resources :bookings

  root 'welcome#index'
end

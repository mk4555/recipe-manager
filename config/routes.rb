Rails.application.routes.draw do
  # devise_for :users, :paths => 'users'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  resources :users do
    resources :recipes
  end

  resources :recipes
  resources :ingredients
  # resources :users, only: [:index, :show]
end

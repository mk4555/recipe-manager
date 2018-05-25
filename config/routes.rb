Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :paths => 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  resources :directions, only: [:new, :create]
  resources :reviews, only: [:new, :create]
  resources :users do
    resources :recipes
  end

  resources :recipes do
    resources :recipe_ingredients, only: [:new, :create]
  end

  resources :ingredients
end

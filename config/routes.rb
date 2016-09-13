Rails.application.routes.draw do
  root :to => "users#new"

  get "logout" => "sessions#destroy"
  get "login" => "sessions#new"
  get "signup" => "users#new"

  resources :users
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

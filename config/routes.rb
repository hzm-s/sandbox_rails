Rails.application.routes.draw do
  resources :users
  resources :users do
  end
end

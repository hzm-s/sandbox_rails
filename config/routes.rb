Rails.application.routes.draw do
  root to: 'lenses#index'

  resources :lenses
end

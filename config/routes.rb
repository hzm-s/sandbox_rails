Rails.application.routes.draw do
  root to: 'inquiries#index'

  resources :inquiries, only: [:index, :new, :create, :show] do
    resources :vc_addresses, only: [:index, :create]
  end
end

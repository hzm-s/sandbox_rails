Rails.application.routes.draw do
  resources :users do
    resource :note, module: :users
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'meetings#index'
  resources :meetings, only: [:index, :new, :create]
  resources :rooms, only: [:index]
end

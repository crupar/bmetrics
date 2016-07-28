Rails.application.routes.draw do
  resources :events
  devise_for :users
  #resources :users

  resources :registered_applications

  root 'registered_applications#index'

end

Rails.application.routes.draw do
  get 'home/index'

  resource :user, only: [:show]

  root 'home#index'
end

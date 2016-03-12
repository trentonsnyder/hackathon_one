Rails.application.routes.draw do
  root 'shared#index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  
end

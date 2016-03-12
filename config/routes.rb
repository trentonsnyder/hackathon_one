Rails.application.routes.draw do
  root 'shared#index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :vehicles do 
    resources :services
  end

  

end

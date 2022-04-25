Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :api do 
    namespace :v1 do 
      resources :backgrounds, only: [:index]
      resources :forecast, only: [:index]
      resources :users, only: [:create]
      resources :munchies, only: [:index]
    end
  end

  get '/', to: 'static#index', as: 'root'
end

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'rooms/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    
   }
   
  root 'homes#index'
  resources :users, :only => [:show,:index]
  resources :relationships, :only => [:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

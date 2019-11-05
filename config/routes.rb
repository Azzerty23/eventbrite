Rails.application.routes.draw do
  root to: "static_pages#index"
  # get 'static_pages/index'
  get 'static_pages/secret'
  get "team", to: "static_pages#team"
  get "contact", to: "static_pages#contact"
  get "user", to: "static_pages#show"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :events
  resources :attendances

end

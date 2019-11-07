Rails.application.routes.draw do
  
  root to: "static_pages#index"
  get 'static_pages/secret'
  get "team", to: "static_pages#team"
  get "contact", to: "static_pages#contact"
  get "user", to: "static_pages#show"
  devise_for :users
  resources :events
  resources :attendances do
    resources :charges
  end

end

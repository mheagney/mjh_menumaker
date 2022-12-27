Rails.application.routes.draw do
  devise_for :users

  resources :menus
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  unauthenticated do
    root "site#index"
  end

  authenticated :user do
    root "menus#index", as: :authenticated_root
  end
end

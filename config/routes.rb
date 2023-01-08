Rails.application.routes.draw do
  devise_for :users

  resources :menus do
    resources :sections do
      patch :move, on: :member
      get :confirm, on: :member
      resources :items do
        patch :move, on: :member
        get :confirm, on: :member
      end
    end
  end
  resources :restaurants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  unauthenticated do
    root "site#index"
  end

  authenticated :user do
    root "menus#index", as: :authenticated_root
  end
end

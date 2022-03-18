Rails.application.routes.draw do
  resources :boards do
    member do
      get :grid
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'boards#home'
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items ,only: [:index,:show,:edit,:create,:update,:destroy] do
    resources :reserveds, only: [:index,:show,:edit,:create,:update,:destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

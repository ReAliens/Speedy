Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
      }
      
      resources :items ,only: [:index,:show,:edit,:create,:update,:destroy] do
        resources :reserveds, only: [:index,:show,:edit,:create,:update,:destroy]
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'

  
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items ,only: [:index,:show,:edit,:create,:update,:destroy] do
        resources :reserveds, only: [:index,:show,:edit,:create,:update,:destroy]
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

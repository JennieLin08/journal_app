Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  resources :categories do
    resources :tasks, only: [:index, :new, :create ,:edit, :update , :destroy]
  end

 
  get "/register", to: "registrations#new"
  post "/register", to: "registrations#create"
  get "/", to: "main#index", as: "root"
  get "/alltasks", to: "tasks#alltasks"

  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

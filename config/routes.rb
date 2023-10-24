Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Projects

  get "/projects/:id", to: "projects#show"
  patch "/projects/:id", to: "projects#update"

  # Contestants

  get "/contestants", to: "contestants#index"
end

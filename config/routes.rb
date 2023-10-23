Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # projects
  get "/projects/:id", to: "projects#show"

  # contestants 
  get "/contestants", to: "contestants#index"
end

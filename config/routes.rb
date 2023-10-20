Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "projects/:id/contestant", to: "projects_contestant#new"

  get "/projects/:id", to: "projects#show"


  get "/contestants", to: "contestants#index"


end

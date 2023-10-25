Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/projects/:id", to: "projects#show"
  post "/projects/:project_id/contestant_project", to: "contestant_projects#create"
  get "/contestants", to: "contestants#index"
end

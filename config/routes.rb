Rails.application.routes.draw do
  devise_for :admin_users
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tokens, only: :create
end

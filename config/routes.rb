Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    post "/sessions" => "sessions#create"

    post "users" => "users#create"
    get "users/:id" => "users#show"
    patch "users/:id" => "users#update"
    delete "users/:id" => "users#destroy"

    get "recommendations" => "recommendations#index"
    post "recommendations" => "recommendations#create"
    get "recommendations/:id" => "recommendations#show"
    delete "recommendations/:id" => "recommendations#destroy"

    get "features" => "features#index"
    get "features/show" => "features#show"

    post "friends" => "friends#create"
    get "friends" => "friends#index"
    get "friends/:id" => "friends#show"
    patch "friends/:id" => "friends#update"
    delete "friends/:id" => "friends#destroy"
  end
end

Rails.application.routes.draw do
  resources :places
  resources :mains

  namespace :api do
    namespace :v1 do
      get :geojson,  to: 'geo_json#geojson', defaults: {format: :json}
    end
  end

  root to: "mains#welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

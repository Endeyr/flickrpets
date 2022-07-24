Rails.application.routes.draw do
  resources :static_pages
  get "/static_pages", to: "static_pages#index"
  get "*path" => redirect("/")
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console
  root to: "static_pages#index"
end

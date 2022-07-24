Rails.application.routes.draw do
  resources :static_pages
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console
  root "home#index"
end

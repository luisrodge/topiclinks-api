Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :topics do
        resources :links
      end
      resources :links
    end
  end
end

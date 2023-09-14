Rails.application.routes.draw do
  namespace :api do
    resources :users, only: :create do
      collection do
        post 'log_in'
      end
    end

    namespace :v1 do
      resources :short_links
    end
  end
end

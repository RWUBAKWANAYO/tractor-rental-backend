Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  namespace :api do
    namespace :v1 do
      resources :users, only: [:update]
      resources :rents
      resources :tractors
      get '/tractors_by_popular', to: 'tractors#tractors_by_popular'
      get '/tractors_by_price', to: 'tractors#tractors_by_price'

   end
  end
end
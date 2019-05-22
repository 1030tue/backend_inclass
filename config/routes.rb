Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teachers
      resources :students
      resources :periods
      resources :trips
      resources :enrolls
      post '/signup', to: "teachers#create" #signup
      post "/login", to: "auth#login" #login

      # get "/auto_login", to: "auth#auto_login"
      get '/profile', to: "teachers#profile" #profile

   end
  end
end

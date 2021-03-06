Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teachers
      resources :students
      resources :periods
      resources :trips
      resources :enrolls
      post '/signup', to: "teachers#create"
      post "/login", to: "auth#login"
      get '/profile', to: "teachers#profile" 
      patch 'students/updateTimer/:id', to: "students#updateTimer"
   end
  end
end

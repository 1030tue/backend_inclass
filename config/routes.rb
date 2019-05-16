Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teachers
      resources :students
      resources :periods
      resources :trips
      resources :enrolls
   end
  end
end

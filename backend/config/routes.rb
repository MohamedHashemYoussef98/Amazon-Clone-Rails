Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login", to: "user#login"
      post "/register", to: "user#register"
    end
  end
end

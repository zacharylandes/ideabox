Rails.application.routes.draw do
  # For details on the DSL availab
   root "welcome#index"
 resources :users do
   resources :ideas
 end
   get '/login', as: 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

    namespace :admin do
   resources :categories
   resources :images
end
end

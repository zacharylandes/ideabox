Rails.application.routes.draw do
  # For details on the DSL availab
   root "welcome#index"
 resources :users do
   resources :ideas
 end
   get '/login', as: 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

    namespace :admin do
   resources :categories
   resources :gifs
   resources :images
end
end

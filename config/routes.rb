ChallahExample::Application.routes.draw do
  put '/profile', to: 'profile#update', as: :update_profile
  get '/profile', to: 'profile#edit', as: :profile

  post '/register', to: 'registration#create', as: :submit_registration
  get '/register', to: 'registration#new', as: :register

  root to: 'home#index'
end

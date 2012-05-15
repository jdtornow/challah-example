ChallahExample::Application.routes.draw do
  match '/profile',     to: 'profile#update',       via: 'put'
  match '/profile',     to: 'profile#edit',         as: 'profile'

  match '/register',    to: 'registration#create',  via: 'post'
  match '/register',    to: 'registration#new',     as: 'register'

  root to: 'home#index'
end
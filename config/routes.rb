Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', registration: 'register'}
  root "posts#index"
  resources :posts, only: [:new, :index, :create]
end

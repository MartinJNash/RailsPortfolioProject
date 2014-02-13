Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects

  root "home#index"
end

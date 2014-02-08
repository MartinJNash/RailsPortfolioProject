Portfolio::Application.routes.draw do
  resources :posts
  resources :projects

  root "home#index"
end

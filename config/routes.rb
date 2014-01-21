Portfolio::Application.routes.draw do
  resources :posts

  root "home#index"
end

Portfolio::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :posts do
    resources :comments
  end
  
  resources :projects

  root "home#index"
end

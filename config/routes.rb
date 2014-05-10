Portfolio::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :posts do
    resources :comments, only: [:index, :create, :update]
  end
  
  resources :projects do
    resources :comments, only: [:create]
  end

  resources :contact_messages, only: [:create]

  root "home#index"
end

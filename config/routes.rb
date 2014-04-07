Portfolio::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :posts do
    resources :comments, only: [:index, :create]
    patch 'comments/:id/approve', to: 'comments#approve', as: 'approve_comment'
  end
  
  resources :projects


  root "home#index"
end

TextNGo::Application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :messages, only: [:index, :new, :create, :show]
  end
end

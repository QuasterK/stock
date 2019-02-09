Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'user#my_portfolio'
  get 'search', to: 'market#search'
  resources :user_stock, only: [:create]
end

Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'user#my_portfolio'
  get 'friendship', to: 'user#friendship'
  get 'search', to: 'market#search'
  resources :user_stock, only: [:create, :destroy]
end

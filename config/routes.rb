Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'search#index'

  match 'search', to: 'search#index', via: [:get, :post]
end

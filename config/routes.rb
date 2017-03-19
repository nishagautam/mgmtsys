Rails.application.routes.draw do
  get 'unit/index'

  get 'unit/new'
  get 'company_profile/new'

  devise_for :users
  get 'home/index'
  root to: "home#index"
  resources :units
  resources :company_profiles
  resources :items
  resources :fiscal_years
  resources :item_groups
  match "/item_groups/new" => "item_groups#create", via: [:get, :post]
  resources :stocks
  resources :suppliers
  resources :sales
  resources :customers
  resources :logs
  resources :purchases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

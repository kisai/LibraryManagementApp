Rails.application.routes.draw do
  devise_for :users

  resources :books
  resources :borrowings
  get 'dashboard/librarian', to: 'dashboards#librarian', as: :librarian_dashboard
  get 'dashboard/member', to: 'dashboards#member', as: :member_dashboard
  root 'books#index'
  get "up" => "rails/health#show", as: :rails_health_check
end

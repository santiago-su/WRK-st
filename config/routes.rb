Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :locations
    resources :transactions
  end

  root 'welcome#index'

end

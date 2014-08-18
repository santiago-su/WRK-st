Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :locations
  end

  root 'welcome#index'

end

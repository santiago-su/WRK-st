Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
    as :admin do
        get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
        patch 'admins/:id' => 'devise/registrations#update', :as => 'admin_registration'
    end

  namespace :admin do
    resources :locations
    resources :transactions
    root 'admin#index'
  end

  root 'welcome#index'

end

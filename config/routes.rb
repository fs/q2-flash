Q2Flash::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  namespace :admin do
    resources :users
    resources :black_domains, :except => [:show, :update]
    match 'settings' => 'settings#edit', :as => :edit_settings
    match 'settings/update' => 'settings#update', :as => :update_settings
  end
end

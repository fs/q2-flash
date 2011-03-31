Q2Flash::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :black_domains, :except => [:show, :update]
    match 'settings' => 'settings#edit', :as => :edit_settings
    match 'settings/update' => 'settings#update', :as => :update_settings
    root :to => 'home#index'
  end

  match 'flash_page/show' => 'flash_page#show', :as => :flash_game
  root :to => "flash_page#show"
end

Videocms::Application.routes.draw do


  resources :publish
  post 'publish/status', to: 'publish#status'

  resources :edit
  post 'edit/status', to: 'edit#status'

  resources :verify
  post 'verify/status', to: 'verify#status'

  resources :upload
  
  devise_for :users

  namespace :admin do
    resources :users
  end

  root :to => "home#index"

end

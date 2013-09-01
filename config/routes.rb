Videocms::Application.routes.draw do

  devise_for :users#,  :controllers => { :registrations => "users/registrations" }

  namespace :admin do
    resources :users
  end

  root :to => "home#index"

end

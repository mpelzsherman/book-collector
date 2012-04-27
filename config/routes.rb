BookCollector::Application.routes.draw do
  root :to => "homepage#index"

  resources :books

  devise_for :users
end
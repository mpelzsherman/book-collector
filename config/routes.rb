BookCollector::Application.routes.draw do
  root :to => "homepage#index"

  devise_for :users
end
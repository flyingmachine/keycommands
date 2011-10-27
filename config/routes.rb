Keycommands::Application.routes.draw do
  resources :apps
  root :to => 'apps#index'
end

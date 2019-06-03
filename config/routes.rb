Rails.application.routes.draw do
  resources :environments
  # resources :environments, only: :index
  patch  '/environmentsByName'      => 'environmentsapi#updateByName'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

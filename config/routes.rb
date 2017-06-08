Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "weathers#index"
  get "/index", to: 'weathers#index'
  post "/index", to: 'weathers#index'
end

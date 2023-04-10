Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/customers/:id', to: 'customers#show'
  patch '/customers/:id', to: 'customers#add_item'

  get '/items', to: 'items#index'

  get '/supermarkets/:id', to: 'supermarkets#show'
end

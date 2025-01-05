Rails.application.routes.draw do
  post '/api/orders', to: 'orders#create'
  post '/api/payments', to: 'payments#create'
  post '/api/shipments', to: 'shipments#create'
  get '/api/orders', to: 'orders#index'
  get '/api/payments', to: 'payments#index'
  get '/api/shipments', to: 'shipments#index'

  get '/api/broker/find/:name', to: 'broker#find'
end

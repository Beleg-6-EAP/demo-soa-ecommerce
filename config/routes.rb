Rails.application.routes.draw do
  post '/api/orders', to: 'orders#create'
  post '/api/payments', to: 'payments#create'
  post '/api/shipments', to: 'shipments#create'
  get '/api/orders', to: 'orders#orders'
  get '/api/payments', to: 'orders#payments'
  get '/api/shipments', to: 'orders#shipments'

  post '/api/registry', to: 'registry#register'
  get '/api/broker/find/:name', to: 'broker#find'
end

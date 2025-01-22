Rails.application.routes.draw do
  wash_out :payments
  wash_out :shipments
  wash_out :orders
  post 'api/orders', to: 'orders#start_order'
  post 'api/registry', to: 'service_registry#create'
  get 'api/orders', to: 'orders#list'
  get 'api/shipments', to: 'shipments#list'
  get 'api/payments', to: 'payments#list'
end

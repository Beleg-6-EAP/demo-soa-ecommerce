Rails.application.routes.draw do
  wash_out :payments
  wash_out :shipments
  wash_out :orders
  post 'api/orders', to: 'purchase#start'
  post 'api/registry', to: 'service_registry#create'
  get 'api/orders', to: 'purchase#orders'
  get 'api/shipments', to: 'purchase#orders'
  get 'api/payments', to: 'purchase#payments'
end

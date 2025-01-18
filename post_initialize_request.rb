require_relative './config/environment'


def register_services
  OrderService.new.register
  puts "order service registred himself in the registry"
  PaymentService.new.register
  puts "payment service registred himself in the registry"
  ShipmentService.new.register
  puts "shipment service registred himself in the registry"
end

sleep(5)

begin
  register_services
rescue => e
  puts "Failed to register service: #{e.message}"
end

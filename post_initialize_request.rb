require_relative './config/environment'

def register_services
  OrderService.register
  PaymentService.register
  ShipmentService.register
end

sleep(3)

begin
  register_services
  puts "All services are now registred in the Service Registry"
rescue => e
  puts "Failed to register service: #{e.message}"
end

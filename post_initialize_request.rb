require_relative './config/environment'


def register_services
  OrderService.register
  PaymentService.register
  ShipmentService.register
end

sleep(5)

begin
  register_services
rescue => e
  puts "Failed to register service: #{e.message}"
end

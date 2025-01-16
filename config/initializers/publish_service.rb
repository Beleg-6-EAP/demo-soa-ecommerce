require_dependency 'order_service'
require_dependency 'payment_service'
require_dependency 'shipment_service'
require_dependency 'service_registry'

OrderService.new.register
PaymentService.new.register
ShipmentService.new.register

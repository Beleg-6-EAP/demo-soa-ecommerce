require_dependency 'service_registry'

ServiceRegistry.instance.register_service('PaymentService', 'Take care of payment processing', 'http://localhost:8080/api/payments')
ServiceRegistry.instance.register_service('ShipmentService', 'Take care of shipment initialization', 'http://localhost:8080/api/shipments')

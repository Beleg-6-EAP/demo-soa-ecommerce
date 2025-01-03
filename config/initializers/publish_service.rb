require_dependency 'broker_service'

BrokerService.instance.register_service('PaymentService', 'Take care of payment processing', 'http://localhost:8080/api/payments')
BrokerService.instance.register_service('ShipmentService', 'Take care of shipment initialization', 'http://localhost:8080/api/shipments')

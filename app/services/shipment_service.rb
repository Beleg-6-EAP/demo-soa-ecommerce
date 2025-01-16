class ShipmentService
  def initialize(order_id = nil, user_id = nil)
    @order_id = order_id
    @user_id = user_id
  end

  def create
    {
      tracking_id: "#{@user_id}-#{@order_id}"
    }
  end

  def register
    ServiceRegistry.instance.register_service('ShipmentService', 'Take care of shipment initialization', 'http://localhost:8080/api/shipments')
  end
end

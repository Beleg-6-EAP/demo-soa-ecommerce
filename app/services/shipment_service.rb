class ShipmentService
  def initialize(order_id)
    @order_id = order_id
  end

  def create
    Shipment.create!(order_id: @order_id, tracking_id: SecureRandom.hex(10))
  end
end

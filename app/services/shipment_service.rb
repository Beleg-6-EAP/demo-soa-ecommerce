class ShipmentService
  def initialize(order_id = nil, user_id = nil)
    @order_id = order_id
    @user_id = user_id
  end

  def create_shipment
    Shipment.create!(order_id: @order_id, tracking_id: "#{@user_id}-#{@order_id}")
  end

  def self.register
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: {
        service: {
          name: "shipment_service",
          wsdl_url: "http://localhost:8080/shipments/wsdl"
        }
      }
    )
  end
end

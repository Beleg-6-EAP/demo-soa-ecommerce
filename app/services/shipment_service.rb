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
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: { name: "ShipmentService", description: "Service to handle shipments", endpoint: "http://localhost:8080/api/shipments" }
    )
  end
end

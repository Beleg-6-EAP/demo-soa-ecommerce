class ShipmentService
  def initialize(order_id, user_id)
    @order_id = order_id
    @user_id = user_id
  end

  def create
    {
      tracking_id: "#{@user_id}-#{@order_id}"
    }
  end
end

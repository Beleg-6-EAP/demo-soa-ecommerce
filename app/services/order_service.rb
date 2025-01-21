class OrderService
  def initialize(user_id = nil, amount = nil)
    @user_id = user_id
    @amount = amount
  end

  def create
    @order = Order.create!(user_id: @user_id, amount: @amount, status: 'pending')

    payment_service = Broker.find('PaymentService')
    payment_success = initiate_payment(payment_service[:endpoint])
    Payment.create!(order_id: @order.id, success: payment_success)

    if payment_success
      shipment_service = Broker.find('ShipmentService')

      tracking_id = initiate_shipment(shipment_service[:endpoint])
      Shipment.create!(order_id: @order.id, tracking_id:)

      @order.update!(status: 'completed')
    else
      @order.update!(status: 'failed')
    end
  rescue StandardError => e
    Rails.logger.error("Error during order creation: #{e.message}")
    @order.update!(status: 'failed')
    @order
  end

  def register
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: { name: "OrderService", description: "Service to handle orders", endpoint: "http://localhost:8080/api/orders" }
    )
  end

  private

  def initiate_payment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order.id })
    response.parsed_response['success']
  end

  def initiate_shipment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order.id, user_id: @user_id })
    response.parsed_response['tracking_id']
  end
end

class OrderService
  def initialize(user_id = nil, amount = nil)
    @user_id = user_id
    @amount = amount
  end

  def create
    @order = Order.create!(user_id: @user_id, amount: @amount, status: 'pending')

    payment_service = Broker.new.find('PaymentService')
    payment_success = initiate_payment(payment_service[:endpoint])

    if payment_success
      shipment_service = Broker.new.find('ShipmentService')

      tracking_id = initiate_shipment(shipment_service[:endpoint])
      Shipment.create!(order_id: @order.id, tracking_id:)
      Payment.create!(order_id: @order.id, success: payment_success)

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
    ServiceRegistry.instance.register_service('OrderService', 'Take care of payment processing', 'http://localhost:8080/api/payments')
  end

  private

  def initiate_payment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order.id }, timeout: 10, persistent: true)
    response.parsed_response['success']
  end

  def initiate_shipment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order.id, user_id: @user_id }, timeout: 10)
    response.parsed_response['tracking_id']
  end
end

class OrderService
  def initialize(user_id, amount)
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
      Shipment.create!(order_id: @order_id, tracking_id:)
      Payment.create!(order_id: @order_id, success: payment_success)

      @order.update!(status: 'completed')
    else
      @order.update!(status: 'failed')
    end

    @order
  end

  private

  def initiate_payment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order_id })
    response.parsed_response['success']
  end

  def initiate_shipment(endpoint)
    response = HTTParty.post(endpoint, body: { order_id: @order_id, user_id: @user_id })
    response.parsed_response['tracking_id']
  end
end

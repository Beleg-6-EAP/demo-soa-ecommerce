class OrderService
  def initialize(user_id = nil, amount = nil)
    @user_id = user_id
    @amount = amount
    @service_bus = ServiceBus
  end

  def create
    @order = Order.create!(user_id: @user_id, amount: @amount, status: 'pending')

    payment_response = @service_bus.call_service(
      "payment_service",
      "process_payment",
      { order: @order.id }
    )
    payment_success = payment_response[:process_payment_response][:value]

    if payment_success

      @service_bus.call_service(
        "shipment_service",
        "create_shipment",
        { order: @order.id, user: @user_id }
      )

      @order.update!(status: 'completed')
    else
      @order.update!(status: 'failed')
    end
  rescue StandardError => e
    Rails.logger.error("Error during order creation: #{e.message}")
    @order.update!(status: 'failed')
    @order
  end

  def self.register
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: {
        service: {
          name: "order_service",
          wsdl_url: "http://localhost:8080/orders/wsdl"
        }
      }
    )
  end
end

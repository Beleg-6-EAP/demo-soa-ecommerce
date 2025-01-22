class PaymentService
  def initialize(order_id = nil)
    @order_id = order_id
  end

  def simulate_payment
    payment_success = [false, true, true].sample
    Payment.create!(order_id: @order_id, success: payment_success)

    payment_success
  end

  def self.register
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: {
        service: {
          name: "payment_service",
          wsdl_url: "http://localhost:8080/payments/wsdl"
        }
      }
    )
  end
end


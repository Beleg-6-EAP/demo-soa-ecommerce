class PaymentService
  def initialize(order_id = nil)
    @order_id = order_id
  end

  def create
    {
      order_id: @order_id,
      success: simulate_payment
    }
  end

  def register
    ServiceRegistry.instance.register_service('PaymentService', 'Take care of payment processing', 'http://localhost:8080/api/payments')
  end

  private

  def simulate_payment
    [false, true, true].sample
  end
end

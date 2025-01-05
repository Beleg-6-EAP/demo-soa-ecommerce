class PaymentService
  def initialize(order_id)
    @order_id = order_id
  end

  def create
    {
      order_id: @order_id,
      success: simulate_payment
    }
  end

  private

  def simulate_payment
    [false, true, true].sample
  end
end

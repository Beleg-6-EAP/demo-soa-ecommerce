require 'rails_helper'

RSpec.describe PaymentService do
  describe '#simulate_payment' do
    let(:order_id) { "1" }
    let(:payment_service) { PaymentService.new(order_id) }

    it 'creates a payment' do
      expect(payment_service.simulate_payment).to change(Payment, :count).by(1)
    end
  end
end

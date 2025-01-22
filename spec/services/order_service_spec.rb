require 'rails_helper'

RSpec.describe OrderService do
  describe '#create' do
    let(:user_id) { "123" }
    let(:amount) { 100.0 }

    before do
      allow(ServiceBus).to receive(:call_service).and_return(
        { process_payment_response: { value: true } },
        { create_shipment_response: {} }
      )
    end

    it 'creates an order with the correct user_id and amount' do
      expect(OrderService.new(user_id, amount).create).to change(Order, :count).by(1)

      order = Order.last
      expect(order.user_id).to eq(user_id)
      expect(order.amount).to eq(amount)
    end
  end
end

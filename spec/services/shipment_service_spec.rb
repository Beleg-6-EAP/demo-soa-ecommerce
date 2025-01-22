require 'rails_helper'

RSpec.describe ShipmentService do
  describe '#create_shipment' do
    let(:order_id) { "1" }
    let(:user_id) { "123-123" }
    let(:shipment_service) { ShipmentService.new(order_id, user_id) }

    it 'creates a shipment with the correct attributes' do
      expect( shipment_service.create_shipment).to change(Shipment, :count).by(1)

      shipment = Shipment.last
      expect(shipment.order_id).to eq("1")
      expect(shipment.tracking_id).to eq("#{user_id}-#{order_id}")
    end
  end
end

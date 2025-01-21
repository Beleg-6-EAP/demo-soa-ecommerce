
require 'rails_helper'
require 'httparty'

RSpec.describe OrderService do
  let(:subject) { described_class.new("1234-1234", 23) }
  let(:payment_service) { { name: "PaymentService", endpoint: "api/payments" } }
  let(:shipment_service) { { name: "ShipmentService", endpoint: "api/shipments" } }

  before do
    allow(Broker).to receive(:find).with('PaymentService').and_return(payment_service)
    allow(Broker).to receive(:find).with('ShipmentService').and_return(shipment_service)
  end

  describe '#create' do
    context 'with payment failed' do
      before do
        allow(HTTParty).to receive(:post).with(payment_service[:endpoint], any_args).and_return(
          instance_double(HTTParty::Response, parsed_response: { 'success' => false })
        )
        subject.create
      end

      it 'creates an order with failed status' do
        expect(Order.last.status).to eq('failed')
      end
    end

    context 'with payment and shipment succeed' do
      before do
        allow(HTTParty).to receive(:post).with(payment_service[:endpoint], any_args).and_return(
          instance_double(HTTParty::Response, parsed_response: { 'success' => true })
        )
        allow(HTTParty).to receive(:post).with(shipment_service[:endpoint], any_args).and_return(
          instance_double(HTTParty::Response, parsed_response: { 'tracking_id' => '1234-1234' })
        )
        subject.create
      end

      it 'creates an order with completed status' do
        expect(Order.last.status).to eq('completed')
      end
    end
  end

  describe '#register' do
    it 'sends a registration request to the registry endpoint' do
      expect(HTTParty).to receive(:post).with(
        "http://localhost:8080/api/registry",
        body: {
          name: "OrderService",
          description: "Service to handle orders",
          endpoint: "http://localhost:8080/api/orders"
        }
      )

    subject.register
    end
  end
end

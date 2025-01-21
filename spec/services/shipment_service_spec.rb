
require 'rails_helper'
require 'httparty'

RSpec.describe ShipmentService do
  subject { described_class.new("1234-1234", "user-1234") }

  describe '#create' do
    let(:result) { subject.create }

    it 'returns a hash with the correct tracking_id' do
      expect(result[:tracking_id]).to eq("#{"user-1234"}-#{"1234-1234"}")
    end
  end

  describe '#register' do
    it 'sends a registration request to the registry endpoint' do
      expect(HTTParty).to receive(:post).with(
        "http://localhost:8080/api/registry",
        body: {
          name: "ShipmentService",
          description: "Service to handle shipments",
          endpoint: "http://localhost:8080/api/shipments"
        }
      )

      subject.register
    end
  end
end

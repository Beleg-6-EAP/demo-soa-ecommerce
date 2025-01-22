require 'rails_helper'

RSpec.describe ShipmentsController, type: :controller do
  describe 'GET #list' do
    it 'responds with status code 200 and returns all shipments' do
      Shipment.create!(order_id: 1, tracking_id: "456-163")
      Shipment.create!(order_id: 2, tracking_id: "789-456")

      get :list

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end
end

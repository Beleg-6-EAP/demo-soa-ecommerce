require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
   describe 'GET #list' do
    it 'responds with status code 200 and returns all payments' do
      Payment.create!(order_id: 1, success: true)
      Payment.create!(order_id: 2, success: false)

      get :list

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end
end

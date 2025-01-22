require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #list' do
    it 'responds with status code 200 and returns all orders' do
      Order.create!(user_id: 1, amount: 100.0, status: 'completed')
      Order.create!(user_id: 2, amount: 40.0, status: 'failed')

      get :list

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #start_order' do
    context 'with valid parameters' do
      it 'creates an order and responds with status code 201' do
        post :start_order, params: { user_id: 1, amount: 100.0 }

        expect(JSON.parse(response.body)['message']).to eq("Purchase started for user 1 with amount 100.0")
        expect(response).to have_http_status(:created)
      end
    end

    context 'with missing parameters' do
      it 'responds with status code 422 and an error message' do
        post :start_order, params: { user_id: 1 }

        expect(JSON.parse(response.body)['error']).to eq("Missing parameters: the user id and the amount are required")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

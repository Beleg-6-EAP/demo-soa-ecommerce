class OrdersController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "create_order",
              :args => { :user =>:string, :amount => :integer },
              :return => :string

  # handels SOAP requests
  def create_order
    order_id = params[:user]
    amount = params[:amount]

    order = OrderService.new(user_id, amount).create

    render :soap => (order.status)
  end

  # handels HTTP requests
  def start_order
    amount = params[:amount]
    user_id = params[:user_id]

    if amount.present? && user_id.present?
      OrderService.new(user_id, amount).create

      render json: { message: "Purchase started for user #{user_id} with amount #{amount}" }, status: :created
    else
      render json: { error: "Missing parameters: the user id and the amount are required" }, status: :unprocessable_entity
    end
  end

  def list
    render json: Order.all, status: :ok
  end
end

class PurchaseController < ApplicationController
  def start
    amount = params[:amount]
    user_id = params[:user_id]

    if amount.present? && user_id.present?
      OrderService.new(user_id, amount).create

      render json: { message: "Purchase started for user #{user_id} with amount #{amount}" }, status: :ok
    else
      render json: { error: "Missing parameters: the user id and the amount are required" }, status: :unprocessable_entity
    end
  end

  def orders
    render json: Order.all, status: :ok
  end

  def shipments
    render json: Shipment.all, status: :ok
  end

  def payments
    render json: Payment.all, status: :ok
  end
end

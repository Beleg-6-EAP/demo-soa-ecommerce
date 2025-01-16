class OrdersController < ApplicationController
  def orders
    render json: Order.all
  end

  def shipments
    render json: Shipment.all
  end

  def payments
    render json: Payment.all
  end

  def create
    user_id = params[:user_id]
    amount = params[:amount]

    order = OrderService.new(user_id, amount)

    order.create

    render json: order, status: :created
  end
end

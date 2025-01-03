class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def create
    user_id = params[:user_id]
    amount = params[:amount]

    order = OrderService.new(user_id, amount).create

    render json: order, status: :created
  end
end

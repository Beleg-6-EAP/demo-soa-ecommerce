class ShipmentsController < ApplicationController
  def index
    render json: Shipment.all, status: :ok
  end

  def create
    user_id = params[:user_id]
    order_id = params[:user_id]

    shipment = ShipmentService.new(user_id, order_id)

    shipment.create

    render json: shipment, status: :created
  end
end

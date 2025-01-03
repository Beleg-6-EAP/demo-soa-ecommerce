class ShipmentsController < ApplicationController
  def index
    render json: Shipment.all, status: :ok
  end

  def create
    order_id = params[:order_id]

    shipment = ShipmentService.new(order_id).create

    render json: shipment, status: :created
  end
end

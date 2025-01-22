class ShipmentsController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "create_shipment",
              :args => { :order => :string, :user => :string },
              :return => :string

  # handels SOAP requests
  def create_shipment
    order_id = params[:order]
    user_id = params[:user]

    shipment = ShipmentService.new(order_id, user_id).create_shipment

    render :soap => (shipment.tracking_id)
  end

  # handels HTTP requests
  def list
    render json: Shipment.all, status: :ok
  end
end

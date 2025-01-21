class ShipmentsController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "create_shipment",
              :args => { :order =>:string, :user => :string },
              :return => :string

  def create_shipment
    order_id = params[:order]
    user_id = params[:user]

    tracking_id = "#{user_id}-#{order_id}"


    render :soap => (tracking_id)
  end
end

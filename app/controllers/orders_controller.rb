class OrdersController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "create_order",
              :args => { :user =>:string, :amount => :integer },
              :return => :string

  def create_shipment
    order_id = params[:user]
    amount = params[:amount]

    order = OrderService.new(user_id, amount).create

    render :soap => (order)
  end
end

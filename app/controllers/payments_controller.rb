class PaymentsController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "process_payment",
              :args => { :order => :string },
              :return => :boolean

  # handels SOAP requests
  def process_payment
    order_id = params[:order]

    payment_success = PaymentService.new(order_id).simulate_payment

    render soap: payment_success
  end

  # handels HTTP requests
  def list
    render json: Payment.all, status: :ok
  end

end

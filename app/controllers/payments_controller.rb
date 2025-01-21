class PaymentsController < ApplicationController
  include WashOut::SOAP
  soap_action "process_payment",
              args: { order_id: :string },
              return: :boolean

  def process_payment
    order_id = params[:order_id]

    payment_success = PaymentService.simulate_payment

    render soap: payment_success
  end
end

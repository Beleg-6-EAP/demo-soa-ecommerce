class PaymentsController < ApplicationController
  def index
    render json: Payment.all, status: :ok
  end

  def create
    order_id = params[:order_id]

    payment = PaymentService.new(order_id)

    payment.create

    render json: payment, status: :created
  end
end

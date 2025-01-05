class BrokerController < ApplicationController
  def find
    service_name = params[:name]

    service = BrokerService.instance.find_service(service_name)

    render json: service, status: :ok
  end
end

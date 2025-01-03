class BrokerController < ApplicationController
  def register
    service_name = params[:name]
    description = params[:description]
    endpoint = params[:endpoint]

    BrokerService.instance.register_service(service_name, description, endpoint)
  end

  def find
    service_name = params[:name]

    service = BrokerService.instance.find_service(service_name)

    render json: service, status: :ok
  end
end

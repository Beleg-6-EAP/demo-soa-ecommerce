class ServiceRegistyController < ApplicationController
  def register
    service_name = params[:name]
    description = params[:description]
    endpoint = params[:endpoint]

    ServiceRegistry.instance.register_service(service_name, description, endpoint)
  end
end

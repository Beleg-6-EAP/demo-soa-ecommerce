class ServiceRegistryController < ApplicationController
  def create
    service = ServiceRegistry.instance.register_service(service_params[:name], service_params[:wsdl_url])
  render json: { message: "Service successfully registered!" }, status: :created
    rescue StandardError => e
      render json: { error: "Service registration failed: #{e.message}" }, status: :unprocessable_entity
  end

  private

  def service_params
    params.require(:service).permit(:name, :wsdl_url)
  end
end


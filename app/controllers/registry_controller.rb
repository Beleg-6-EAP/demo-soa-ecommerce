class RegistryController < ApplicationController
  def register
    service_name = params[:name]
    description = params[:description]
    endpoint = params[:endpoint]

    Rails.logger.info "Received params: #{params.inspect}"

    # Validate the presence of required parameters
    if service_name.blank? || endpoint.blank?
      render json: { error: 'Service name and endpoint are required' }, status: :unprocessable_entity
      return
    end

    # Register the service using the ServiceRegistry singleton
    begin
      ServiceRegistry.instance.register_service(service_name, description, endpoint)
      render json: { message: 'Service registered successfully', name: service_name }, status: :created
    rescue => e
      Rails.logger.error "Service registration failed: #{e.message}"
      render json: { error: 'Failed to register service', details: e.message }, status: :internal_server_error
    end
  end
end

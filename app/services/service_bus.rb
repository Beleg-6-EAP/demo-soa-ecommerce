class ServiceBus
  def self.call_service(service_name, operation, message)
    service = ServiceRegistry.instance.find_service(service_name)
    raise "Service '#{service_name}' not found in registry" unless service

    client = Savon.client(wsdl: service[:wsdl_url])

    begin
      response = client.call(operation.to_sym, message: message)
      response.body
    rescue Savon::Error => e
      raise "Error: #{e.message}"
    end
  end
end



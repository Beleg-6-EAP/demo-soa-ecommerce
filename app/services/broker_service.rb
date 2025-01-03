class BrokerService
  def initialize
    @services = []
  end

  def self.instance
    @instance ||= BrokerService.new
  end

  def register_service(name, description, endpoint)
    @services << { name: name, description: description, endpoint: endpoint }
  end

  def find_service(name)
    @services.find { |service| service[:name] == name }
  end
end

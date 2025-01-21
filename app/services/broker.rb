
class Broker
  def self.find(name)
    ServiceRegistry.instance.find_service(name)
  end
end

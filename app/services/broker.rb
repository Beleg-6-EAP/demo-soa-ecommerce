
class Broker
  def find(name)
    ServiceRegistry.instance.find_service(name)
  end
end

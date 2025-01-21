require 'rails_helper'

RSpec.describe ServiceRegistry do
  describe '#register_service' do
    let(:subject) { ServiceRegistry.instance }

    before do
      subject.register_service('TestService', 'A test service', '/test/endpoint')
    end

    it 'adds a service to the registry' do
      expect(subject.find_service("TestService")).to eq(
        {
          name: "TestService",
          description: "A test service",
          endpoint: "/test/endpoint"
        }
      )
    end
  end

  describe '#find_service' do
    before do
      subject.register_service('TestService1', 'A test service 1', '/test/endpoint1')
      subject.register_service('TestService2', 'A test service', '/test/endpoint2')
      subject.register_service('TestService3', 'A test service', '/test/endpoint3')
    end

    context "with non existing service" do
      it 'returns nil' do
        expect(subject.find_service('non_existent_service')).to be_nil
      end
    end

    context "with existing service" do
      it 'finds a registered service by name' do
        expect(subject.find_service('TestService2')[:name]).to eq('TestService2')
      end
    end
  end
end


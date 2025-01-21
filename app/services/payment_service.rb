class PaymentService
  def self.simulate_payment
    [false, true, true].sample
  end

  def self.register
    HTTParty.post(
      "http://localhost:8080/api/registry",
      body: {
        service: {
          name: "payment_service",
          wsdl_url: "http://localhost:8080/payments/wsdl"
        }
      }
    )
  end
end


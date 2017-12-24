require 'Mollie/API/Client'

class MollieCreateCustomerService
  attr_reader :shopping_basket

  def initialize(shopping_basket_id)
    @shopping_basket = ShoppingBasket.find(shopping_basket_id)
  end

  def call
    mollie = Mollie::API::Client.new(ENV['MOLLIE_API_KEY'])
    
    customer = mollie.customers.create(name: shopping_basket.member.whole_name,
                                      email: shopping_basket.member.email)

    shopping_basket.member.update(mollie_customer_id: customer.id)

    customer
  end

end

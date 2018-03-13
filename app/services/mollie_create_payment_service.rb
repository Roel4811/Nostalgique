# require 'Mollie/API/Client'

class MollieCreatePaymentService
  attr_reader :shopping_basket, :confirmation_url

  def initialize(shopping_basket_id, confirmation_url)
    @shopping_basket = ShoppingBasket.find(shopping_basket_id)
    @confirmation_url = confirmation_url
  end

  def call
    mollie = Mollie::API::Client.new(ENV['MOLLIE_API_KEY'])

    payment = mollie.payments.create(amount: shopping_basket.payment_amount,
                                    description: shopping_basket.payment_description,
                                    redirect_url: confirmation_url)

    shopping_basket.update(mollie_payment_id: payment.id,
                          mollie_payment_url: payment.links["payment_url"])

    payment
  end

end

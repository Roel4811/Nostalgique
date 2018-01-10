class OrdersController < ApplicationController
  before_action :authorize

  def new
    set_shopping_basket

    if !current_member
      redirect_to new_member_orders_path
      return false
    end

    @member = current_member
  end

  def pay
    if !uncompleted_shopping_basket
      raise
      redirect_to new_order_path
      return
    end

    shopping_basket = uncompleted_shopping_basket
    if Rails.env.test?
      bypass_payment_process_order(shopping_basket)
    else
      shopping_basket.submitted_by_customer_at = DateTime.now
      if shopping_basket.save
        create_mollie_customer_and_payment(shopping_basket)
      end
    end
  end

  private

    def create_mollie_customer_and_payment(shopping_basket)
      if MollieCreateCustomerService.new(shopping_basket.id).call
        payment = MollieCreatePaymentService.new(
          shopping_basket.id,
          orders_confirmation_url(id_token: shopping_basket.id_token)
        ).call
      else
        puts "niet gelukt"
        redirect_to new_order_path
      end

      redirect_to payment.links["payment_url"]
    end

    def uncompleted_shopping_basket
      if session[:basket_id].present?
        @uncompleted_shopping_basket ||= ShoppingBasket.uncompleted.find_by(id_token: session[:basket_id])
      else
        @uncompleted_shopping_basket ||= nil
      end
    end

    def set_shopping_basket
      if uncompleted_shopping_basket
        @shopping_basket = uncompleted_shopping_basket
      else
        @shopping_basket = ShoppingBasket.new
      end

      if current_member
        @shopping_basket.member_id = current_member.id
      else
        @shopping_basket.member_id = nil
      end

      if @shopping_basket.new_record? || @shopping_basket.changed_attributes.any?
        @shopping_basket.save
        session[:basket_id] = @shopping_basket.id_token
      end
    end

end

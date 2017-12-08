class PagesController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
  end

  def donate
  end

  def pay
    set_shopping_basket
    shopping_basket.submitted_by_customer_at = DateTime.now
    if shopping_basket.save
      create_mollie_customer_and_payment(shopping_basket)
    end
  end

  private

    def set_shopping_basket
      shopping_basket = Shopping_basket.new
    end

end

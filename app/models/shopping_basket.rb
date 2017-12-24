class ShoppingBasket < ApplicationRecord
  belongs_to :member

  scope :uncompleted, -> { where(payment_succeeded_at: nil) }

  before_create :generate_id_token

  def payment_amount
    5
  end

  def payment_description
    "Nostalgique donation"
  end

  def generate_id_token(size = 6)
    return true if self.id_token.present?

    begin
      self.id_token = SecureRandom.urlsafe_base64[0...size]
    end while ShoppingBasket.exists?(id_token: self.id_token)
  end

end

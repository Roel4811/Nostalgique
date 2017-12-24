class Member < ApplicationRecord
  has_many :shopping_baskets

  has_secure_password

  def whole_name
    "#{self.first_name} #{self.last_name}"
  end
  
end

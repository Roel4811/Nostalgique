class Member < ApplicationRecord
  has_many :shopping_baskets
  has_many :songs

  has_secure_password

  def send_password_reset
    MemberMailer.password_reset(self).deliver
  end

  def whole_name
    "#{self.first_name} #{self.last_name}"
  end

end

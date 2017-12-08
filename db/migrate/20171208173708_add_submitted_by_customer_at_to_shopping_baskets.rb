class AddSubmittedByCustomerAtToShoppingBaskets < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_baskets, :submitted_by_customer_at, :datetime
  end
end

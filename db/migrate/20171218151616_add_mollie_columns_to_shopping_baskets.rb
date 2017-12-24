class AddMollieColumnsToShoppingBaskets < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_baskets, :mollie_customer_id, :string
    add_column :shopping_baskets, :mollie_payment_id, :string
    add_column :shopping_baskets, :mollie_payment_method, :string
    add_column :shopping_baskets, :mollie_payment_status, :string
    add_column :shopping_baskets, :mollie_payment_amount, :string
    add_column :shopping_baskets, :mollie_payment_description, :string
    add_column :shopping_baskets, :mollie_payment_created_at, :datetime
    add_column :shopping_baskets, :mollie_payment_paid_at, :datetime
    add_column :shopping_baskets, :mollie_payment_cancelled_at, :datetime
    add_column :shopping_baskets, :mollie_payment_expired_at, :datetime
    add_column :shopping_baskets, :mollie_payment_profile_id, :string
    add_column :shopping_baskets, :mollie_payment_redirect_url, :string
    add_column :shopping_baskets, :mollie_payment_webhook_url, :string
    add_column :shopping_baskets, :mollie_consumer_name, :string
    add_column :shopping_baskets, :mollie_consumer_account, :string
    add_column :shopping_baskets, :mollie_consumer_bic, :string
    add_column :shopping_baskets, :mollie_card_holder, :string
    add_column :shopping_baskets, :mollie_card_number, :string
    add_column :shopping_baskets, :mollie_card_security, :string
    add_column :shopping_baskets, :mollie_called_at, :datetime
    add_column :shopping_baskets, :payment_succeeded_at, :datetime
    add_column :shopping_baskets, :mollie_payment_url, :string

    add_column :members, :mollie_customer_id, :string
  end
end

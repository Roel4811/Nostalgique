class CreateShoppingBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_baskets do |t|
      t.string :id_token
      t.integer :member_id
      t.datetime :completed_at

      t.timestamps
    end
    add_index :shopping_baskets, :id_token
    add_index :shopping_baskets, :member_id
  end
end

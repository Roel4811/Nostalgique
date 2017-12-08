class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth

      t.timestamps
    end
  end
end

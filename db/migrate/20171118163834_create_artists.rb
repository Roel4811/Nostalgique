class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists, id: :integer do |t|
      t.string :name

      t.timestamps
    end
  end
end

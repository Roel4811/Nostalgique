class RemoveImageFromSongs < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :image, :string
  end
end

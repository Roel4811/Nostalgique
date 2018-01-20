class AddStatusToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :status, :integer, default: 0
  end
end

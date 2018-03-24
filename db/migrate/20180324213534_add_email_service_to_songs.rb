class AddEmailServiceToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :email_service, :boolean
  end
end

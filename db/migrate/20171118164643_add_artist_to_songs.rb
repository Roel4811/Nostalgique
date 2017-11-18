class AddArtistToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :artist, type: :integer, foreign_key: true
  end
end

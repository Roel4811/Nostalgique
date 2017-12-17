class AddLyricsEnToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :lyrics_en, :text
  end
end

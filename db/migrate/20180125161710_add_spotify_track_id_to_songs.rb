class AddSpotifyTrackIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :spotify_track_id, :string
  end
end

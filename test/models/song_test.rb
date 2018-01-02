require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "Song has a name, lyrics and artist_id" do
    @artist = Artist.create(name: "Philip")
    @song = Song.new(name: "Song-name", lyrics: "lalala", artist_id: @artist.id)
    assert_valid(@song)
  end
end

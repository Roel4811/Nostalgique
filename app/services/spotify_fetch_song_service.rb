class SpotifyFetchSongService
  attr_reader :song_name
  def initialize(song_name)
    @song_name = song_name
  end

  def call
    spotify = RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    if spotify
      song = RSpotify::Track.search(song_name).first
      return song
    else
      return "No song was found"
    end
  end
end

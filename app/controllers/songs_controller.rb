class SongsController < ApplicationController
  before_action :authorize, except: %i(index show)

  def index
    @songs = Song.without_deleted.only_active
  end

  def new
    @user = current_member
  end

  def create
    song = Song.new
    artist = Artist.find_or_create_by(name: song_params[:artist_name])
    song.artist = artist
    song.member = current_member
    song.name = song_params[:name]
    song.lyrics = song_params[:lyrics]
    song.lyrics_en = song_params[:lyrics_english]

    if song.save!
    else
      redirect_to '/songs/new', alert: 'There was a problem when creating the song'
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

    def song_params
      params.require(:song).permit(:name, :artist_name, :lyrics, :lyrics_english)
    end

end

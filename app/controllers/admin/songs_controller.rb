class Admin::SongsController < Admin::ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  before_action :authorize

  def index
    @songs = Song.search(params[:search])
    @songs_count = @songs.count
  end

  def show
    # respond_to do |format|
    #   format.js
    # end
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.new(song_params)
    artist = Artist.find_or_create_by(name: artist_params[:artist])
    song.artist = artist
    if song.save!
      redirect_to admin_root_path
      flash[:notics] = "Song successfully created!"
    else
      redirect_to new_admin_song_path
      flash[:warning] = "Something went wrong"
    end
  end

  def edit
  end

  def update
    artist = Artist.find_or_create_by(name: artist_params[:artist])
    @song.artist = atist
    if @song.update!(song_params)
      redirect_to admin_root_path
      flash[:notics] = "Song successfully updated!"
    else
      redirect_to edit_admin_song_path(@song)
      flash[:warning] = "Something went wrong"
    end
  end

  private

  def song_params
    params.require(:song).permit(:name, :member_id, :image_url, :lyrics, :lyrics_en)
  end

  def artist_params
    params.require(:song).permit(:artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end

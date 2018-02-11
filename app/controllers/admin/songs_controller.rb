class Admin::SongsController < Admin::ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :delete]
  before_action :authorize

  def index
    @songs = Song.search(params[:search])
    @songs = @songs.send(show_or_hide_deleted)
    @songs = @songs.order("songs.#{sort_column} #{sort_direction}, songs.id DESC")
    @songs_count = @songs.count
  end

  def show
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

  def delete
    if @song.deleted_at.blank?
      @song.deleted_at = DateTime.now
      flash[:notice] = "Song is deleted"
    else
      flash[:notice] = "Song is restored"
      @song.deleted_at = nil
    end
    @song.save(validate: false)
    redirect_to admin_root_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :member_id, :image_url, :lyrics, :lyrics_en)
  end

  def sort_column
    Song.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
  helper_method :sort_column

  def artist_params
    params.require(:song).permit(:artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end

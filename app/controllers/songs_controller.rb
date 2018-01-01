class SongsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
    @songs = Song.all
  end

  # def create
  #   @song = Song.new(song_params)
  #   respond_to do |format|
  #     format.json do
  #       if @song.save
  #         flash[:notice] = "Thank you!"
  #         render json: @song
  #       else
  #         flash[:notice] = "Did't work"
  #         render json: { errors: @song.errors.messages }, status: 422
  #       end
  #     end
  #   end
  # end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @artist = Artist.find_or_create_by(name: artist_params[:artist])
    @song.artist = @artist
    @song.member = current_member

    if @song.save!
      redirect_to translate_song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def translate
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update!(song_params)
      redirect_to root_path
    else
      render :translate
      flash[:error] = "not updated"
    end
  end

  private

    def song_params
      params.require(:song).permit(:lyrics, :name, :image, :lyrics_en)
    end

    def artist_params
      params.require(:song).permit(:artist)
    end

end

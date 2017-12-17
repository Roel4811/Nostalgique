class SongsController < ApplicationController

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

    if @song.save!
      redirect_to songs_path
    else
      render :new
    end
  end

  private

    def song_params
      params.require(:song).permit(:lyrics, :name, :image)
    end

    def artist_params
      params.require(:song).permit(:artist)
    end

end

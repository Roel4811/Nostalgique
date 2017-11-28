class SongsController < ApplicationController

  def index
  end

  def create
    @song = Song.new(song_params)
    respond_to do |format|
      format.json do
        if @song.save
          flash[:notice] = "Thank you!"
          render json: @song
        else
          flash[:notice] = "Did't work"
          render json: { errors: @song.errors.messages }, status: 422
        end
      end
    end
  end

  private

    def song_params
      params.require(:song).permit(:lyrics, :name, :artist_id)
    end
end

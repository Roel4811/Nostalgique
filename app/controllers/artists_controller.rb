class ArtistsController < ApplicationController
  before_action :set_artist, only: :show

  def index
    @artists = Artist.order('lower(name)')
  end

  def show
    @songs = @artist.songs
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end

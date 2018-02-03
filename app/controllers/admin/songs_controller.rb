class Admin::SongsController < Admin::ApplicationController
  before_action :set_song, only: [:show]

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
  end

  def create
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

end

class PagesController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
  end

end

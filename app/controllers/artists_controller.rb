class ArtistsController < ApplicationController

  def index
    @artists = Artist.order('lower(name)')
  end

end

class Admin::ArtistsController < Admin::ApplicationController

  def index
    @artists = Artist.all
    @artists_count = @artists.count
  end

end

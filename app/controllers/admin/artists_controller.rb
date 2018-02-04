class Admin::ArtistsController < Admin::ApplicationController

  def index
    @artists = Artist.search(params[:search])
    @artists_count = @artists.count
  end

end

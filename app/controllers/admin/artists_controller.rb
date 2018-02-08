class Admin::ArtistsController < Admin::ApplicationController
  before_action :authorize
  
  def index
    @artists = Artist.search(params[:search])
    @artists_count = @artists.count
  end

end

class SongsController < ApplicationController
  before_action :authorize, except: %i(index show)
  before_action :load_song_wizard, except: %i(validate_step index show new create)

  def index
    @songs = Song.without_deleted.only_active
  end

  def new
    @user = current_member
  end

  def step1
    @no_nav = true
  end

  def step2
    @no_nav = true
  end

  def step3
    @no_nav = true
    @song = SpotifyFetchSongService.new(@song_wizard.name).call
    @song_image = @song.album.images[1]["url"]
    session[:song_image_url] = @song_image
    session[:spotify_id] = @song.id
  end

  def step4
    @no_nav = true
  end

  def step5
    @no_nav = true
  end

  def validate_step
    current_step = params[:current_step]
    @song_wizard = wizard_song_for_step(current_step)
    @song_wizard.song.attributes = song_wizard_params
    session[:song_attributes] = @song_wizard.song.attributes
    if @song_wizard.valid?
      next_step = wizard_song_next_step(current_step)
      create and return unless next_step

      redirect_to action: next_step
    else
      render current_step
    end

  rescue ActiveRecord::AssociationTypeMismatch
    session[:artist_name] = song_wizard_params[:artist] if song_wizard_params[:artist].present?
    session[:spotify_track_id] = song_wizard_params[:spotify_track_id] if song_wizard_params[:spotify_track_id]
    next_step = wizard_song_next_step(current_step)
    create and return unless next_step
    redirect_to action: next_step
  end

  def create
    song = Song.new
    artist = Artist.find_or_create_by(name: song_params[:artist_name])
    song.artist = artist
    song.member = current_member
    song.name = song_params[:name]
    song.lyrics = song_params[:lyrics]
    song.lyrics_en = song_params[:lyrics_english]

    if song.save!
    else
      redirect_to '/songs/new', alert: 'There was a problem when creating the song'
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

    def load_song_wizard
      @song_wizard = wizard_song_for_step(action_name)
    end

    def wizard_song_next_step(step)
      Wizard::Song::STEPS[Wizard::Song::STEPS.index(step) + 1]
    end

    def wizard_song_for_step(step)
      raise InvalidStep unless step.in?(Wizard::Song::STEPS)

      "Wizard::Song::#{step.camelize}".constantize.new(session[:song_attributes])
    end

    def song_wizard_params
      params.require(:song_wizard).permit(:name, :artist, :image_url, :spotify_id, :spotify_track_id, :lyrics, :lyrics_en)
    end

    def song_params
      params.require(:song).permit(:name, :artist_name, :lyrics, :lyrics_english)
    end

    class InvalidStep < StandardError; end
end

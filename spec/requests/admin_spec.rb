require 'rails_helper'

RSpec.describe "AdminSongs", type: :request do
  it "shows songs from database" do
    member = FactoryGirl.create(:member)
    artist = FactoryGirl.create(:artist)
    song = FactoryGirl.create(:song, member: member, artist: artist)

    visit admin_songs_path
    page.should have_content(song.name)
  end
end

require 'rails_helper'

RSpec.describe "AdminSongs", type: :request do
  it "shows songs from database" do
    member = FactoryGirl.create(:member)
    artist = FactoryGirl.create(:artist)
    song = FactoryGirl.create(:song, member: member, artist: artist)

    visit admin_songs_path
    page.should have_content(song.name)
  end

  it "adds a new song", type: :request do
    visit new_admin_song_path
    fill_in "Name", with: "La terre est ronde"
    fill_in "Artist", with: "Orelsan"
    fill_in "Member", with: "Roel"
    fill_in "Lyrics", with: "au fond, je croix que la terre est rond... laala"
    fill_in "Lyrics en", with: "sincerely, I believe that the world is round... lala"
    click_button "Create Song"
    page.should have_content("La terre est ronde")
  end
end

require 'rails_helper'

RSpec.describe "GetTrackFromSpotify", type: :request do
  it "save spotify track image to song" do
    member = FactoryGirl.create(:member)
    visit root_path
    fill_in "email", with: member.Email
    fill_in "password", with: "secret"
    click_button "Log in"

    click_link "add song"
    fill_in "song name", with: "La Terre est Ronde"
    click_button "Continue"
    full_in "artist", with: "Orelsan"
    click_button "Continue"
    click_button "Check for song on Spotify"
    sleep(2)
    page.should have_content("Song found!")
    click_button "Continue"
    @song_wizard.image_url.should exist
  end
end

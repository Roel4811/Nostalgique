require 'rails_helper'

RSpec.describe "GetTrackFromSpotify", type: :request do
  it "save spotify track image to song" do
    member = FactoryGirl.create(:member)
    visit root_path
    click_link "Add Song"
    fill_in "Email", with: member.email
    fill_in "Password", with: "secret"
    click_button "Log in"

    click_link "Add Song"
    fill_in "name", with: "La Terre est Ronde"
    click_button "Continue"
    fill_in "artist", with: "Orelsan"
    click_button "Continue"
    page.should have_content("Song found!")
    click_button "Continue"
    @song_wizard.image_url.should exist
  end
end

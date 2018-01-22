require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  it "emails member when requesting password reset" do
    member = FactoryGirl.create(:member)
    visit log_in_members_path
    click_link "password"
    fill_in "email", with: member.email
    click_button "Reset password"
    current_path.should eq(root_path)
    page.should have_content("Email sent")
    last_email.to.should include(member.email)
  end
end

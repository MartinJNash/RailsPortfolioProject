require "test_helper"

feature "As a user, I want to sign out to protect my privacy" do
 
  include Warden::Test::Helpers
  Warden.test_mode!

  scenario "sign out of service", js: true do

    login_as users(:editor)
    visit root_path

    # When I click on sign out
    click_on "Sign out"

    # Then I should be signed out
    page.text.must_match /signed out/i
    page.text.must_match /success/i
  end
end

require "test_helper"

feature "As a user, I want to sign out to protect my privacy" do
  
  scenario "sign out of service" do

    # Given I have a signed in user
    test_sign_in

    # When I click on sign out
    click_on "Sign out"

    # Then I should be signed out
    page.text.must_match /signed out/i
    page.text.must_match /success/i
  end
end

require "test_helper"

# As a site visitor
# I want to be able to create an account
# so that I can have full access to members-only areas

feature "Create an account" do
  scenario "create account with good data" do

    # Given I am on the account creation page
    visit root_path
    click_on "Create account"

    # When I register with correct information
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "pw1234"
    click_on "Create!"

    # Then I will be redirected to a welcome page
    page.must_have_content "success"
  end
end

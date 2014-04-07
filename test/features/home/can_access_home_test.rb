require "test_helper"

feature "CanAccessHome" do
  scenario "can access home" do
    visit "/"
    page.must_have_content "Martin"
  end
end

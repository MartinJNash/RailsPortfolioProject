require "test_helper"

feature "Check For Zurb" do
  scenario "confirm that the layout is in Zurb" do
    visit root_path
    page.must_have_css(".columns")
  end
end

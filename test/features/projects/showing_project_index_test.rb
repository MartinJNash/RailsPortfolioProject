require "test_helper"

feature "Showing Project Index" do
  scenario "see all projects" do

    visit projects_path

    page.must_have_content "Yes, We Kansai"
    page.must_have_content "Cocoa"
  end
end

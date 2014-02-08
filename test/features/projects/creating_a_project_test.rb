require "test_helper"

feature "Creating a project" do
  scenario "create a new project" do
    visit projects_path

    click_on "New Project"

    fill_in "Name", with: "Cool New App"
    fill_in "Technologies used", with: "Ruby, Rails, Zurb Foundation, HTML5"
    click_on "Create Project"

    page.text.must_include "Cool New App"
    page.text.must_include "Zurb Foundation"
    page.text.must_include "uccessfully"
    page.text.must_include "created"
  end
end

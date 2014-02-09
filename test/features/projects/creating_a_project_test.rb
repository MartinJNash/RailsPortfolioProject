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


  scenario "new project has bad data" do
    # Given I have a form full of invalid project data
    visit new_project_path
    fill_in "Name", with: "A"
    fill_in "Technologies used", with: ""

    # When form is submitted
    click_on "Create Project"

    # Then the form should be displayed again with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "you can give your project a better name than that"
    page.text.must_include "Are you sure you didn't use any technologies?"
  end

end

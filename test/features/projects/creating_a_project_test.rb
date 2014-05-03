require "test_helper"

feature "Creating a project" do
  scenario "create a new project" do
    visit new_project_path

    app_name = "Cool New App"
    technologies = "Ruby, Rails, Zurb Foundation, HTML5"

    fill_in "Name", with: app_name
    fill_in "Technologies used", with: technologies
    click_on "Create Project"

    page.status_code.must_equal 200
    page.text.must_include app_name
    page.text.must_include technologies
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

  scenario "new project with image" do
    visit new_project_path
    page.must_have_css '#project_image'
    
    file = File.join(Rails.root, 'test/fixtures/files/test_image.png')
    attach_file 'Image', file


    click_on 'Create Project'
    page.status_code.must_equal 200
  end
 
end

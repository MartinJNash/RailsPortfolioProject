require "test_helper"

feature "Showing An Individual Project" do
  

  scenario "view a single project's page" do

    # Given I have a project
    # When I am on the project page
    ywk_project = projects(:ywk)
    visit project_path(ywk_project)

    # Then...
    page.must_have_content ywk_project.name
    page.must_have_content ywk_project.technologies_used
  end
end

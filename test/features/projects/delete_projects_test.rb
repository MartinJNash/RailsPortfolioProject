require "test_helper"

feature "Projects::DeletePosts" do
  scenario "delete a project from the show project view" do

    test_sign_in

    # Given I am on the project's show page
    project = projects(:ywk)
    visit project_path(project)

    # When I click on delete
    click_on "Destroy"

    # Then the post should be gone
    page.text.wont_include project.technologies_used
  end
end

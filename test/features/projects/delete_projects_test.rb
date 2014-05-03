require "test_helper"

feature "Projects::DeletePosts" do
  scenario "delete a project from the show project view" do

    test_sign_in

    # Given I am on the project's show page
    visit project_path(projects(:ywk))

    # When I click on delete
    click_on "Destroy"

    # Then the post should be gone
    page.text.must_include "Successfully deleted project."
  end
end

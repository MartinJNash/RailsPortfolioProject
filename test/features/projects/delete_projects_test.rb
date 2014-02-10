require "test_helper"

feature "Projects::DeletePosts" do
  scenario "delete a post from the show post view" do
    
    # Given I am on the project's show page
    visit project_path(projects(:ywk))

    # When I click on delete
    click_on "Delete"

    # Then the post should be gone
    page.text.must_include "Successfully deleted project."
  end
end

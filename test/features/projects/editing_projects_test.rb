require "test_helper"

feature "Editing Projects" do


  scenario "update a project's properties" do

    new_name = "YELP Clone"
    new_technologies_used = "iOS, Cocoa"

    # given I have a project that I want to update
    project = projects(:portfolio)

    # when I submit a form for an edited project
    visit edit_project_path(project)
    fill_in "Name", with: new_name
    fill_in "Technologies used", with: new_technologies_used
    click_on "Update Project"

    # then the properties will be updated
    page.text.must_include new_name
    page.text.must_include new_technologies_used
    current_path.must_equal project_path(project)
    
  end



  scenario "incorrectly edit a projct" do
    # Given an existin project
    project = projects(:portfolio)

    # When I submit invalid changes
    visit edit_project_path(project)
    fill_in "Name", with: ""
    fill_in "Technologies used", with: ""
    click_on "Update Project"

    # Then the changes should not be saved, and I should get to try again
    page.text.must_include "errors"
  end
end

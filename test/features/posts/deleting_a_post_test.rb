require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do

    # Given I have a bad post on my list of posts
    test_sign_in
    visit posts_path

    # When I click the delete button
    bad_post = posts(:drunken)
    page.find("[id='delete_post_#{bad_post.id}']").click

    # Then the post should be gone
    page.text.wont_include bad_post.title
  end
end

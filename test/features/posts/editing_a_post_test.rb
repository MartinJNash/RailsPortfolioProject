require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do

    # Given an existing post
    the_author = users(:author)
    the_post = the_author.posts.first
    test_sign_in(the_author.role)

    visit post_path(the_post)

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "A much better post"
    fill_in "Body", with: "This is so much better now"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "updated"
    page.text.must_include "A much better post"
    page.text.must_include "This is so much better now"

  end
end

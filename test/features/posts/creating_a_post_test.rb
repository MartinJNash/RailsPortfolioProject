require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create new post" do

    the_post = posts(:class)

    # Given an authorized user completes a new post form
    sign_in
    visit new_post_path
    fill_in "Title", with: the_post.title
    fill_in "Body", with: the_post.body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include the_post.title
    page.text.must_include the_post.body
    page.has_css? "#author"
    page.text.must_include users(:one).email
  end
end



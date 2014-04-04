require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create new post" do

    # the_post = posts(:class)
    post_title = "MY NEW TITLE"
    post_body = "MY NEW BODY"
    the_author = users(:author)

    # Given an authorized user completes a new post form
    test_sign_in(the_author.role)
    visit new_post_path
    fill_in "Title", with: post_title
    fill_in "Body", with: post_body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include post_title
    page.text.must_include post_body
    page.has_css? "#author"
    page.text.must_include the_author.email

  end


  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthorized visitors cannot see a new post button" do
    visit posts_path
    page.wont_have_link "New Post"
  end

  scenario "authors can't publish" do
    test_sign_in(:author)
    visit new_post_path
    page.wont_have_field 'Published'
  end

  scenario "editors can publish" do
    
    # Given I am logged in as an editor
    test_sign_in(:editor)
    visit new_post_path

    # I can see the published checkbox
    page.must_have_field "Published"
    
    #when I submit the form
    fill_in "Title", with: posts(:one).title
    fill_in "Body", with: posts(:one).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"

  end
end



require "test_helper"

feature "As an author" do

  # Given that I am logged in as an author
  before do
    @author = users(:author)
    @other_user = users(:one)
    sign_in(@author.role)
  end

  scenario "I want to only see my posts, so I can focus on my work" do
    
    # When I am on the posts page
    visit posts_path

    # Then I should see only my posts
    page.must_have_content @author.posts.first.title
    page.wont_have_content @other_user.posts.first.title
  end


  scenario "I want to create posts, so I can share my great ideas with the world" do

    new_title = "MY NEW POST"
    new_body = "MY NEW BODY"

    # When I fill out a new post form and hit submit
    visit new_post_path
    fill_in "Title", with: new_title
    fill_in "Body", with: new_body
    click_on "Create Post"

    # Then the post should be successfully created
    page.must_have_content /success/i
    page.must_have_content new_title
    page.must_have_content new_body

  end

  scenario "I want to edit posts, so I can fix typos" do
    
    new_title = "MY NEW POST"
    new_body = "MY NEW BODY"

    # When I am on the page to edit my post
    first_post = @author.posts.first
    visit edit_post_path(first_post)

    # And submit the edit form
    fill_in "Title", with: new_title
    fill_in "Body", with: new_body
    click_on "Update Post"

    # Then the post should be updated successfully
    page.must_have_content /success/i
    page.must_have_content new_title
    page.must_have_content new_body

  end

  scenario "I should not be able to delete posts, so I can give the editor full editorial control" do

    # When I go to the delete post page
    first_post = @author.posts.first
    visit post_path(first_post)

    # Then I should get a not authorized warning
    page.wont_have_content "Delete"


  end

end

require "test_helper"

feature "As an author" do

  # Given that I am logged in as an author
  before do
    @author = users(:author)
    @other_user = users(:one)
    test_sign_in(@author.role)

    @post_title = "MY NEW POST"
    @post_body = "MY NEW BODY"
  end

  scenario "I want to only see my posts, so I can focus on my work" do
    
    # When I am on the posts page
    visit posts_path

    # Then I should see only my posts
    page.must_have_content @author.posts.first.title
    page.wont_have_content @other_user.posts.first.title
  end


  scenario "I want to create posts, so I can share my great ideas with the world" do

    # When I fill out a new post form and hit submit
    make_new_post(@post_title, @post_body)

    # Then the post should be successfully created
    check_page_content [/success/i, @post_title, @post_body]
  end

  scenario "I want to edit posts, so I can fix typos" do

    # When I am on the page to edit my post
    first_post = @author.posts.first
    edit_existing_post(first_post, @post_title, @post_body)

    # Then the post should be updated successfully
    check_page_content [/success/i, @post_title, @post_body]
  end

  scenario "I should not be able to delete posts, so I can give the editor full editorial control" do

    # When I go to the delete post page
    first_post = @author.posts.first
    visit post_path(first_post)

    # Then I should get a not authorized warning
    page.wont_have_content "Delete"


  end

end

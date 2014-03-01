require "test_helper"

feature "As an editor" do

  before do
    @editor = users(:editor)
    sign_in(@editor.role)
    @post_title = "Catchy title"
    @post_body  = "A nice body"
  end

  scenario "I want to see all posts regardless of published status in the blog index so that I can choose which posts to publish" do
    visit posts_path
    Post.all.each do |post|
      page.must_have_content post.title
    end
  end

  scenario "I want to create posts so that I can share great content with the world" do
    # When I fill out and submit a new post
    make_new_post(@post_title, @post_body)

    # Then I should see my new post
    check_page_content [@post_title, @post_body, /success/i, @editor.email]
  end


  scenario "I want to update posts so that I can fix typos" do

    # Given I have an existing post
    the_post = @editor.posts.first

    # When I edit and submit changes
    edit_existing_post(the_post, @post_title, @post_body)

    # Then I should see my changes
    check_page_content [@post_title, @post_body, /success/i, @editor.email]
  end


  scenario "I want to publish posts so that I can make posts live on the site" do

    # Given I have an unpublished post
    unpublished = Post.where(published: false).first

    # When I check the 'published' box
    visit edit_post_path(unpublished)
    check "Published"
    click_on "Update Post"

    # Then the post should be published
    check_page_content [/success/i, /published/i]
  end  


  scenario "I want to delete posts so that I can remove opium-fueled Jabberwocky" do
    pub_post = Post.where(published: true).first
    visit post_path(pub_post)

    # save_and_open_page
    click_on "Delete"

    check_page_content [/deleted/i]
  end

end

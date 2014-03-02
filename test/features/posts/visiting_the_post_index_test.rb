require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include posts(:one).title
    page.text.must_include posts(:one).body
  end
end

require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    # Given existing posts
    Post.create(title: "Being awesome", body: "It is what I always try for.")

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include "Being awesome"
  end
end

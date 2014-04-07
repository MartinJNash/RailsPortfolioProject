require 'test_helper'

# As a site owner, 
# I want to allow logged in users to comment on posts, 
# So that we can have a civil exchange of opinions between mature adults.

feature 'Commenting on posts' do
 
  feature 'Logged in users' do

    before do
      test_sign_in(:editor)
      post = posts(:one)
      visit post_path(post)
    end

    scenario 'can add a comment if valid' do
      within('#new_comment') do
        fill_in "Content", with: "Cool story bro!"
        click_on 'Comment'
      end
      page.must_have_content /success/i
    end

    scenario 'cannot add a blank comment' do
      within('#new_comment') do
        fill_in "Content", with: ""
        click_on 'Comment'
      end
      page.must_have_content "Couldn't create comment."
    end
    
  end 


  feature 'Visitors' do

    scenario "should not see the add comment form" do
      post = posts(:one)
      visit post_path(post)
      page.wont_have_css('#new_comment')
    end

  end

end

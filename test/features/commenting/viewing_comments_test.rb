require 'test_helper'

# As a site owner, 
# I want to allow logged in users to comment on posts, 
# So that we can have a civil exchange of opinions between mature adults.

feature 'Viewing post comments' do
 
  scenario 'Logged in users should not see unapproved commentss' do
    test_sign_in(:editor)
    confirm_no_negatives
  end

  scenario 'Logged in users should see approved commentss' do
    test_sign_in(:editor)
    confirm_positives
  end

  scenario "Visitors should not see unapproved comments" do
    confirm_no_negatives
  end

  scenario "Visitors should see approved comments" do
    confirm_positives
  end

  def confirm_positives
    go_to_post
    page.must_have_content comments(:positive).content
  end

  def confirm_no_negatives
    go_to_post
    page.wont_have_content comments(:negative).content
  end

  def go_to_post
    post = posts(:one)
    visit post_path(post)
  end

end

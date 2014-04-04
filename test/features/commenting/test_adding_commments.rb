require 'test_helper'

feature 'As a site owner, I want to allow people to comment on posts' do
  

  scenario 'Adding a valid comment' do
    post = posts(:one)
    visit post_path(post)

    within('#new_comment') do
      fill_in "Content", with: "Cool story bro!"
      click_on 'Comment'
    end

    page.must_have_content /success/i
  end


  scenario 'Adding a blank comment' do
    post = posts(:one)
    visit post_path(post)

    within('#new_comment') do
      fill_in "Content", with: ""
      click_on 'Comment'
    end

    page.must_have_content "Couldn't create comment."
  end


end

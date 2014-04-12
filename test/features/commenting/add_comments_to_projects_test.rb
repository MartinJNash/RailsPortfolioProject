require 'test_helper'

feature 'commenting on projects' do
  feature 'logged in users' do

    before do
      test_sign_in :editor
      project = projects(:ywk)
      visit project_path project
    end

    scenario 'adding a comment' do

      within('#new_comment') do
        fill_in "Content", with: "Cool story bro!"
        click_on 'Comment'
      end
      page.must_have_content /success/i

    end
  end 


  feature 'regular users' do

    scenario 'cannot see a comment submission form' do
      project = projects(:ywk)
      visit project_path project
      page.wont_have_css '#new_comment'
    end
  end

end

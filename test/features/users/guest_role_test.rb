require "test_helper"

feature "As a guest (visitor)" do


  before do 
    visit posts_path
  end
  
  scenario "I want to view (read) posts so that I can enjoy quality content" do
    page.must_have_content posts(:initial).title
    page.must_have_content posts(:initial).body
  end


  scenario "I should not be able to delete, update or create posts so that I can't modify a site I don't own" do
    page.wont_have_link "Delete"
    page.wont_have_link "Destroy"
    page.wont_have_link "Edit"
  end


  scenario "I want to only see published posts so that I don't see crap drafts" do
    page.wont_have_content posts(:draft).title
    page.wont_have_content posts(:draft).body
  end
end




# I want to view (read) posts so that I can enjoy quality content
# I should not be able to delete, update or create posts so that I can't modify a site I don't own
# I want to only see published posts so that I don't see crap drafts

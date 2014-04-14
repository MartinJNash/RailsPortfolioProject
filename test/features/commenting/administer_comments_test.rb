require 'test_helper'


feature 'As an admin or editor, I should be able to approve comments' do
  scenario 'I should be able to see unapproved comments count' do
    test_sign_in :editor

    post = posts(:one)
    visit post_path(post)
    page.must_have_content '3 unapproved comments'

    click_on 'review comments'
  end

  scenario 'I should be able to access the administer commonts page' do
    test_sign_in :editor

    post = posts(:one)
    visit post_comments_path(post)
    page.must_have_button 'approve!'

    first('.comment_approve').click
    page.must_have_content /success/i

  end

  scenario 'update comments new way' do
    test_sign_in :editor

    post = posts(:one)
    visit post_comments_path(post)

    first('.comment_approve').click
    page.must_have_content /success/i

  end

end

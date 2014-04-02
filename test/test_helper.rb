ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

require 'simplecov'
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  fixtures :all
end


# Make the integration tests use features
class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Devise::TestHelpers
end


def sign_in(role = :editor)
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'password'
  find("form").click_on "Sign in"
end








def fill_in_post_form(post_title, post_body)
  fill_in "Title", with: post_title
  fill_in "Body", with: post_body
end

def make_new_post(post_title, post_body)
  visit new_post_path
  fill_in_post_form(post_title, post_body)
  click_on "Create Post"
end

def edit_existing_post(extant_post, new_title, new_body)
  visit edit_post_path(extant_post)
  fill_in_post_form(new_title, new_body)
  click_on "Update Post"
end



def check_page_content(array = [])
  array.each { |content| page.must_have_content content }
end

# Turn.config.format = :cue

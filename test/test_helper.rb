ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"


class ActiveSupport::TestCase
  fixtures :all
end


# Make the integration tests use features
class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Devise::TestHelpers
end


def sign_in
  visit new_user_session_path
  fill_in "Email", with: users(:one).email
  fill_in "Password", with: 'password'
  find("form").click_on "Sign in"
end

# Turn.config.format = :cue

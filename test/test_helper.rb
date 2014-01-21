ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"


# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  # include Capybara::RspecMatchers
  include Capybara::DSL
end

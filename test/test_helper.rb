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
end


# Turn.config.format = :cue

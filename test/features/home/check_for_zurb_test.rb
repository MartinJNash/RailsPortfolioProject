require "test_helper"

feature "Check For Zurb" do
  scenario "confirm that the layout is in Zurb" do
    visit root_path

    page.must_have_css(".row .columns")
    page.source.must_include("foundation.js")
    page.source.must_include("foundation_and_overrides.css")

    # Must have
    # config.assets.debug = true
    # in test.rb
  end
end

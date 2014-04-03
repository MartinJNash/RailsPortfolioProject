require "test_helper"

feature "can sign in with twitter" do
  
  scenario "I can success" do
    visit new_user_session_path

     OmniAuth.config.test_mode = true
     Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
     Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
     OmniAuth.config.add_mock(:twitter, { uid: '12345', info: { nickname: 'test_twitter_user' }})

     click_on "Sign in with Twitter"
     page.must_have_content "test_twitter_user, you are signed in!"
  end

end

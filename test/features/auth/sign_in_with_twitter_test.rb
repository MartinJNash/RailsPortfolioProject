require "test_helper"

feature "Signing in with social networks" do
  
  scenario "Twitter" do
    visit new_user_session_path

     OmniAuth.config.test_mode = true
     Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
     Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
     OmniAuth.config.add_mock(:twitter, { uid: '12345', info: { nickname: 'test_twitter_user' }})

     within '.omniauth-links' do
       click_on "Sign in with Twitter"
     end
     
     page.must_have_content "test_twitter_user, you are signed in!"
  end

  scenario "Facebook" do
    visit new_user_session_path

    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    OmniAuth.config.add_mock(:facebook, { uid: '12345', info: { nickname: 'test_facebook_user' }})

    within '.omniauth-links' do
     click_on "Sign in with Facebook"
    end

    page.must_have_content "test_facebook_user, you are signed in!"
  end

end

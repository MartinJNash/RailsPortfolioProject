require "test_helper"

feature "Signing in with social networks" do
  
  def mock_provider(provider)
     OmniAuth.config.test_mode = true
     Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
     Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[provider]
     OmniAuth.config.add_mock(provider, { uid: '12345', info: { nickname: "test_#{provider}_user" }})    
  end

  scenario "Twitter" do
    visit new_user_session_path
    mock_provider :twitter

    within '.omniauth-links' do
     click_on "Sign in with Twitter"
    end
    
    page.must_have_content "test_twitter_user, you are signed in!"
  end

  scenario "Facebook" do
    visit new_user_session_path
    mock_provider :facebook

    within '.omniauth-links' do
     click_on "Sign in with Facebook"
    end

    page.must_have_content "test_facebook_user, you are signed in!"
  end

  scenario "Github" do
    visit new_user_session_path
    mock_provider :github

    within '.omniauth-links' do
      click_on "Sign in with Github"
    end

    page.must_have_content "test_github_user, you are signed in!"
  end

end

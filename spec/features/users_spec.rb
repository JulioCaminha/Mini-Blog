require 'rails_helper'
include Warden::Test::Helpers

Warden.test_mode!

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
    Warden.test_reset! 
  end
end

describe 'User Registration' do
  user = FactoryGirl.create(:user)
    it 'allows a user to sign up' do
      visit new_user_registration_path
      fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => user.email
      fill_in 'Password', :with => user.password
      fill_in 'Password confirmation', :with => user.password_confirmation
      click_button 'Sign up'
     expect(page).to have_content("Welcome")
    end

    it "should allow a registered user to log in" do
      visit new_user_session_path
      login_as(user, :scope => :user)
    end

end

describe "Non User Login" do

    it "should not allow non users to sign in" do
      visit new_user_session_path
      save_and_open_page
      fill_in "user_login", :with => "Invalid User"
      fill_in "Password", :with => "fakepassword"
      click_button "Log in"
      expect(page).to_not have_content("Signed")
    end
  end
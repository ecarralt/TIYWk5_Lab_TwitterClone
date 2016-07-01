require "test_helper"

class UserCanSignInTest < Capybara::Rails::TestCase
  test "user can sign-in" do
    visit welcome_path
    fill_in('Username', :with => "ecarralt")
    fill_in('Password', :with => "12345678")
    click_button "Sign In"
    assert_content page, "Welcome to Thinker"
  end
end

require "test_helper"

class UserCanSignUpTest < Capybara::Rails::TestCase



  test "user can sign up" do
    visit welcome_path
    click_link "Sign Up"
    fill_in('First name', :with => "enrique")
    fill_in('Last name', :with => "carral")
    fill_in('Username', :with => "ecarralt")
    fill_in('Password', :with => "12345678")
    fill_in('Re-type password', :with => "12345678")
    click_button "Submit"
    assert_content page, "Start sharing your thoughts and follow your favorite Thinkers!"

  end



end

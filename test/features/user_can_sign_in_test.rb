require "test_helper"


class UserCanSignInTest < Capybara::Rails::TestCase

  setup do
    User.create! username: "ecarralt", password: "12345678", first_name: "Enrique", last_name: "Carral", photo_tag: "ecarralt.jpg" , blurb: "This is where I put my thoughts"
  end


  test "user can sign-in" do
    visit welcome_path
    fill_in('Username', :with => "ecarralt")
    fill_in('Password', :with => "12345678")
    click_button "Sign In"
    assert_content page, "Welcome to Thinker ecarralt"
  end
end

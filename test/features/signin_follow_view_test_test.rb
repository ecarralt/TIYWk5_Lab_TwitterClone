require "test_helper"

class SigninFollowViewTestTest < Capybara::Rails::TestCase
  setup do
    user1 = User.create! username: "ecarralt", password: "12345678", first_name: "Enrique", last_name: "Carral", photo_tag: "ecarralt.jpg" , blurb: "This is where I put my thoughts"
    user2 = User.create! username: "jordan", password: "12345678", first_name: "Michael", last_name: "Jordan"

    Thought.create! body: "Hello, my name is Michael and I rock basketball", user_id: user2.id
    Thought.create! body: "My number is 23, and I rock the world", user_id: user2.id

  end



  test "user can sign-in follow user and see user's posts" do
    visit welcome_path
    fill_in('Username', :with => "ecarralt")
    fill_in('Password', :with => "12345678")
    click_button "Sign In"
    assert_content page, "Welcome to Thinker @ecarralt"

    click_link "All Thinkers"
    click_link "Follow"
    click_link "Home"

    assert_content "Hello, my name is Michael and I rock basketball"
    assert_content "My number is 23, and I rock the world"


  end


end

require 'test_helper'

class UserCanEditTheirAccountTest < ActionDispatch::IntegrationTest
  test "a user can edit their account" do
    create_user
    login_user
    assert page.has_content?("John")
    click_link "Edit"

    fill_in "Username", with: "new-username"
    fill_in "Password", with: "new-password"
    click_button "Update Account"

    assert page.has_content?("new-username")
    refute page.has_content?("John")
  end

  test "an admin can not edit a user's account" do
    user = create_user
    create_admin
    login_admin
    visit '/dashboard'

    refute page.has_content?("John")
    
    visit edit_user_path(user.id)

    assert page.has_content?("admin")
    refute page.has_content?("John")
  end

end

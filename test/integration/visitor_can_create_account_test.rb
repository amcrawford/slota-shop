require "test_helper"

class VisitorCanCreateAccountTest < ActionDispatch::IntegrationTest

  test "visitor can create account" do

    category_1 = Oil.create(name: "Lard")

    Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)

    visit chips_path
    within("#slotachips") do
      click_button "Add to Cart"
    end

    visit "/"

    within (".right") do
      assert page.has_content?("Login")
      assert page.has_content?("Create Account")
    end

    within(".right") do
      click_link "Create Account"
    end

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Create Account"

    assert page.has_content? "Logged in as John"
    assert_equal user_path(User.last.id), current_path

    refute page.has_content?("Login")
    assert page.has_content?("Logout")

    visit "/cart"

    assert page.has_content?("Slotachips")

    within(".right") do
      click_link "Logout"
    end

    refute page.has_content?("Logout")
    assert page.has_content?("Login")
  end
end

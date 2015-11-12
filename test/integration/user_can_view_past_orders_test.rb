require 'test_helper'

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "user can view past orders" do
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    user = User.create(username: "John", password: "Password")

    visit '/'

    click_link "Login"

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit user_orders_path(user.id)

    assert page.has_content?("Order 1")
    assert page.has_content?("Order 2")
  end
end
require 'test_helper'

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "user can view all past orders" do
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    user = User.create(username: "John", password: "Password")
    order = user.orders.create(total_price: 20)
    order.chip_orders.create(chip_id: item_1.id, quantity: 1, subtotal: 20)

    visit '/'

    click_link "Login"

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit user_orders_path(user.id)

    assert page.has_content?("Ordered On: #{order.created_at}")
  end

  test "user can view a singular past order" do
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    user = User.create(username: "John", password: "Password")
    order = user.orders.create(total_price: 20)
    order.chip_orders.create(chip_id: item_1.id, quantity: 1, subtotal: 20)

    visit '/'

    click_link "Login"

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit user_orders_path(user.id)

    click_link "View Order Details"
    within(".chips_ordered") do
      assert page.has_content?("Slotachips")
      assert page.has_content?("1")
      assert page.has_content?("20")
      assert page.has_content?("View Chip")
      assert page.has_content?("available")
    end

    within(".order_total") do
      assert page.has_content?("20")
    end

    within(".order_status") do
      assert page.has_content?("Ordered At: #{order.created_at}")
      assert page.has_content?("Status")
      assert page.has_content?("Updated At: ")
    end
  end
end

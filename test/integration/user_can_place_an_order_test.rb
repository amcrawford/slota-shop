require "test_helper"

class UserCanPlaceAnOrderTest < ActionDispatch::IntegrationTest
  test "registered user can place an order" do
    category_1 = Oil.create(name: "Lard")

    Chip.create(name: "Slotachips", price: 20,
                description: "Super yummy", oil_id: category_1.id)

    User.create(username: "John", password: "Password")

    visit "/"

    within(".right") do
      click_link "Login"
    end

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit chips_path

    within("#slotachips") do
      click_button "Add to Cart"
    end

    visit "/cart"
    click_button "Place Order"

    assert_equal new_order_path, current_path
    fill_in "Address", with: "1 Street"
    click_button "Checkout"

    assert page.has_content?("Order was successfully placed")
    assert page.has_content?("Cart (0)")

    visit "/cart"
    click_button "Place Order"
    fill_in "Address", with: "1 Street"
    click_button "Checkout"

    assert page.has_content?("Cart cannot be empty.")
  end
end

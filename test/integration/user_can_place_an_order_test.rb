require 'test_helper'

class UserCanPlaceAnOrderTest < ActionDispatch::IntegrationTest
  test "registered user can place an order" do
    category_1 = Oil.create(name: "Lard")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)

    user = User.create(username: "John", password: "Password")

    visit '/'

    click_link "Login"

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit chips_path

    within("#slotachips") do
      click_button "Add to Cart"
    end

    visit '/cart'

    click_button "Place Order"

    assert page.has_content?("Your order has been placed")
  end

  test "unregistered user can place an order" do
    skip
  end

end

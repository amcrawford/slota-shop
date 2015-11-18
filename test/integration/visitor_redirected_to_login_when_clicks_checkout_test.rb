require "test_helper"

class VisitorRedirectedToLogin < ActionDispatch::IntegrationTest
  test "user that has not logged in directed to login when click checkout" do
    skip
    create_shop
    create_user
    create_cart_for_visitor

    visit "/cart"
    click_button "Place Order"

    assert_equal login_path, current_path
    assert page.has_content?("Please login before placing order.")

    login_user
    visit "/cart"

    assert page.has_content?("Cart (1)")

    click_button "Place Order"

    assert_equal "/orders", current_path
    assert page.has_content?("Order was successfully placed")
    assert page.has_content?("Logout")
  end
end

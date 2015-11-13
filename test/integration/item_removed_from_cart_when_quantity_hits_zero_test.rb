require "test_helper"

class ItemRemovedFromCartWhenQuantityHitsZeroTest < ActionDispatch::IntegrationTest
  test "when quantity hits zero item is removed from cart" do
    create_shop
    visit chips_path

    within("#slotachips") do
      click_button "Add to Cart"
    end

    within("#dang-coconut") do
      click_button "Add to Cart"
    end

    visit cart_chips_path

    within ("#slotachips") do
      assert page.has_content?("Slotachips")
      within (".quantity") do
        assert page.has_content?("1")
      end
      click_button "-"
    end

    assert_equal cart_chips_path, current_path

    within (".chips") do
      refute page.has_content?("Slotachips")
    end
    assert page.has_content?("Successfully removed Slotachips from your cart.")

    within (".cart_total") do
      assert page.has_content?("Total: $17")
    end
  end
end

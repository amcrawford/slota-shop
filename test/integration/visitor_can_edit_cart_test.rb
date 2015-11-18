require "test_helper"

class VisitorCanEditCartTest < ActionDispatch::IntegrationTest
  test "visitor can remove an item from his or her cart" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit chips_path

    within("#slotachips") do
      click_button "Add to Cart"
    end

    visit cart_chips_path

    within('#slotachips') do
      click_link "Remove"
    end

    assert_equal cart_chips_path, current_path

    assert page.has_content?("Successfully removed Slotachips from your cart.")

    within(".chips") do
      refute page.has_content?("Slotachips")
    end

    click_link "Slotachips"
    assert_equal "/chips/slotachips", current_path
  end

  test "user can adjust the quantity of an item in the cart" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    Chip.create(name: "Slotachips", price: 20.50, description: "Super yummy", oil_id: category_1.id)
    Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit chips_path

    within("#slotachips") do
      click_button "Add to Cart"
    end

    within("#dang-coconut") do
      click_button "Add to Cart"
    end

    visit cart_chips_path

    within ('#slotachips') do
      assert page.has_content?("Slotachips")
      within ('.quantity') do
        assert page.has_content?("1")
      end
      click_button "add"
    end

    assert_equal cart_chips_path, current_path

    within ('#slotachips') do
      within ('.quantity') do
        assert page.has_content?("2")
      end
      within ('.subtotal') do
        assert page.has_content?("41")
      end
    end

    within (".cart_total") do
      assert page.has_content?("$58")
    end

    within ('#slotachips') do
      click_button "remove"
    end

    assert_equal cart_chips_path, current_path

    within ('#slotachips') do
      within ('.quantity') do
        assert page.has_content?("1")
      end
      within ('.subtotal') do
        assert page.has_content?("20")
      end
    end

    within (".cart_total") do
      assert page.has_content?("$37")
    end
  end
end

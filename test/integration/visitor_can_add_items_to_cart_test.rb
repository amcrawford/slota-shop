require 'test_helper'

class VisitorCanAddItemsToCart < ActionDispatch::IntegrationTest

  test "visitor can add items to cart from index" do
    category_1 = OilType.create(name: "Lard")
    category_2 = OilType.create(name: "Coconut Oil")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_type_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_type_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_type_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_type_id: category_1.id)

    visit chips_path

    assert page.has_content?("View Cart (0)")

    within("#slotachips") do
      click_button "Add to Cart"
    end

    assert page.has_content?("Added Slotachips to cart.")
    assert page.has_content?("View Cart (1)")

    click_link "View Cart"

    assert_equal cart_chips_path, current_path

    assert page.has_content?("Slotachips")
    assert page.has_content?("20")
    assert page.has_content?("Super yummy")
    assert page.has_content?("Total: $20")
  end

  test "can add multiple items to cart" do
    skip
  end

  test "can add item to cart from item show" do
    skip
  end

  test "can add item to cart from category show pages" do
    skip
  end
end

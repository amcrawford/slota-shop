require 'test_helper'

class VisitorCanAddItemsToCartTest < ActionDispatch::IntegrationTest

  test "visitor can add items to cart from index" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit chips_path

    within(".right") do
      assert page.has_content?("Cart (0)")
    end

    within("#slotachips") do
      click_button "Add to Cart"
    end

    assert page.has_content?("Added Slotachips to cart.")
    assert page.has_content?("Cart (1)")

    within(".right") do
      click_link "Cart"
    end

    assert_equal cart_chips_path, current_path

    assert page.has_content?("Slotachips")
    assert page.has_content?("20")
    assert page.has_content?("Super yummy")
    assert page.has_content?("Total: $20")
  end

  test "can add multiple items to cart" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit chips_path

    assert page.has_content?("Cart (0)")

    within("#slotachips") do
      click_button "Add to Cart"
    end

    assert page.has_content?("Added Slotachips to cart.")
    assert page.has_content?("Cart (1)")

    within("#lard-yummies") do
      click_button "Add to Cart"
    end

    within(".right") do
      click_link "Cart"
    end

    assert_equal cart_chips_path, current_path

    assert page.has_content?("Slotachips")
    assert page.has_content?("20")
    assert page.has_content?("Super yummy")

    assert page.has_content?("Lard Yummies")
    assert page.has_content?("19")
    assert page.has_content?("Chock Full of Lard")

    assert page.has_content?("Total: $39")
  end

  test "can add chip to cart from chip show" do
    skip
  end

  test "can add item to cart from category show pages" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit '/lard'

    assert page.has_content?("Cart (0)")

    within("#slotachips") do
      click_button "Add to Cart"
    end

    assert page.has_content?("Added Slotachips to cart.")
    assert page.has_content?("Cart (1)")

    within(".right") do
      click_link "Cart"
    end

    assert_equal cart_chips_path, current_path

    assert page.has_content?("Slotachips")
    assert page.has_content?("20")
    assert page.has_content?("Super yummy")
    assert page.has_content?("Total: $20")
  end
end

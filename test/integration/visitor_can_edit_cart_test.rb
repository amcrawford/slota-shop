require 'test_helper'

class VisitorCanEditCartTest < ActionDispatch::IntegrationTest
  test "visitor can remove an item from his or her cart" do
    category_1 = Oil.create(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit '/cart'

    within('.slotachips') do
      clink_link "Remove"
    end

    assert_equal '/cart', current_path

    assert page.has_content?("Successfully removed Slotachips from your cart.")

    within('#chips') do
      refute page.has_content?("Slotachips")
    end

    clink_link "Slotachips"
    assert_equal '/slotachips', current_path


  end
end

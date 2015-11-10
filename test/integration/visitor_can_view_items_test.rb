require 'test_helper'

class VisitorCanViewItemsTest < ActionDispatch::IntegrationTest
  test "visitor can view items test" do
    item_1 = create_chip("Slotachips", 20, "Super yummy")
    item_2 = create_chip("Trader Joe's BBQ", 15, "I'd trade slota for these!")
    item_3 = create_chip("Dang Coconut", 17, "Dang, these are good")

    visit '/chips'

    within(".chips") do
      assert page.has_content?("Slotachips")
      assert page.has_content?("Trader Joe's BBQ")
      assert page.has_content?("Dang Coconut")
    end
  end

  test "visitor can view items by category" do

    category_1 = Oil.new(name: "Lard")
    category_2 = Oil.create(name: "Coconut Oil")
    category_1.save

    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_id: category_2.id)
    item_3 = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: category_2.id)
    item_4 = Chip.create(name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_id: category_1.id)

    visit oils_path

    click_link "Lard"

    assert current_path, '/oils/lard'

    within(".chips") do
      assert page.has_content?("Slotachips")
      assert page.has_content?("Lard Yummies")
    end

    click_link "Return to oils"

    click_link "Coconut Oil"

    assert current_path, '/oils/coconut-oil'

    within(".chips") do
      assert page.has_content?("Trader Joe's BBQ")
      assert page.has_content?("Dang Coconut")
    end
  end

  
end

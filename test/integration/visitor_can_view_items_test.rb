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
end

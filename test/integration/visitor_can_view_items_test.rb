require "test_helper"

class VisitorCanViewItemsTest < ActionDispatch::IntegrationTest
  test "visitor can view items test" do
    create_chip("Slotachips", 20, "Super yummy")
    create_chip("Trader Joe's BBQ", 15, "I'd trade slota for these!")
    create_chip("Dang Coconut", 17, "Dang, these are good")

    visit '/chips'

    within(".chips") do
      assert page.has_content?("Slotachips")
      assert page.has_content?("Trader Joe's BBQ")
      assert page.has_content?("Dang Coconut")
    end
  end

  test "visitor can view items by category" do
    create_shop
    visit oils_path

    within("#lard") do
      click_link "Lard"
    end

    assert current_path, "/lard"

    within(".chips") do
      assert page.has_content?("Slotachips")
    end

    click_link "Return to oils"

    within("#coconut-oil") do
      click_link "Coconut Oil"
    end

    assert current_path, '/coconut-oil'

    within(".chips") do
      assert page.has_content?("Dang Coconut")
    end
  end
end

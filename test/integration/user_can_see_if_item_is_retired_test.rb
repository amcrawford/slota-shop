require 'test_helper'

class UserCanSeeIfItemIsRetiredTest < ActionDispatch::IntegrationTest
  test 'user can see retired item status on order show page' do
    create_shop_and_logged_in_user

    within(".old-chips") do
        assert page.has_content?("retired")
    end
  end

  test 'user can see retired item status on chip show pages' do
    create_shop_and_logged_in_user

    visit '/chips'
    within("#old-chips") do
      assert page.has_content?("Item is Retired")
    end

    visit '/chips/old-chips'
    assert page.has_content?("Item is Retired")

    visit '/lard'
    within("#old-chips") do
      assert page.has_content?("Item is Retired")
    end
  end

end

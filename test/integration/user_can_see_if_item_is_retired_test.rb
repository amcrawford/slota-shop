require 'test_helper'

class UserCanSeeIfItemIsRetiredTest < ActionDispatch::IntegrationTest
  test 'user can see retired item status on order show page' do
    create_shop_and_logged_in_user

    within(".old-chips") do
        assert page.has_content?("retired")
    end
  end

  test 'user can NOT see retired item status on chip show pages' do
    create_shop_and_logged_in_user

    visit '/chips'
    refute page.has_content?("Item is Retired")

    visit '/lard'
    refute page.has_content?("Item is Retired")
  end
end

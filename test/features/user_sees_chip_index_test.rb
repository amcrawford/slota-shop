require "test_helper"

class IndexViewTest < ActionDispatch::IntegrationTest
  test 'user does not see chip description on index page' do
    create_shop
    visit chips_path

    refute page.has_content?("Super yummy")
  end

end

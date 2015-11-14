require "test_helper"

class AdminCanViewOrdersTest < ActionDispatch::IntegrationTest
  test "admin can view the dashboard" do
    create_admin
    login_admin
    visit '/admin/dashboard'

    assert page.has_content?("Admin Dashboard")
  end

  test "a registered user can not see the dashboard" do
    create_user
    login_user
    visit '/admin/dashboard'

    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("404")
  end

  test "a guest can not see the dashboard" do
    visit '/admin/dashboard'

    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("404")
  end

  test "admin can view orders on the dashboard" do
    skip
  end

  test "admin can fliter order by order type" do
    skip
  end

  test "admin can cancel a 'paid' order" do
    skip
  end

  test "admin can cancel an 'ordered' order" do
    skip
  end

  test "admin can mark an 'ordered' order as 'paid'" do
    skip
  end

  test "admin can mark a 'paid' order as 'completed'" do
    skip
  end

end

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
    user = create_user
    order1 = create_order("Ordered", 5, user.id)
    order2 = create_order("Paid", 6, user.id)
    order3 = create_order("Cancelled", 7, user.id)
    order4 = create_order("Completed", 8, user.id)
    login_admin_to_dashboard

    within("#order-#{order1.id}") do
      assert page.has_content?("#{order1.id}")
      assert page.has_content?("Ordered")
      assert page.has_content?("[mark as paid]")
      refute page.has_content?("[mark as complete]")
      assert page.has_content?("[cancel]")
    end

    within("#order-#{order2.id}") do
      assert page.has_content?("#{order2.id}")
      assert page.has_content?("Paid")
      refute page.has_content?("[mark as paid]")
      assert page.has_content?("[mark as complete]")
      assert page.has_content?("[cancel]")
    end

    within("#order-#{order3.id}") do
      assert page.has_content?("#{order3.id}")
      assert page.has_content?("Cancelled")
      refute page.has_content?("[mark as paid]")
      refute page.has_content?("[mark as complete]")
      refute page.has_content?("[cancel]")
    end

    within("#order-#{order4.id}") do
      assert page.has_content?("#{order4.id}")
      assert page.has_content?("Completed")
      refute page.has_content?("[mark as paid]")
      refute page.has_content?("[mark as complete]")
      refute page.has_content?("[cancel]")
    end
  end

  test "admin can see the number of orders of each status type" do
    order1 = create_order("Ordered", 5, 1)
    order2 = create_order("Ordered", 5, 1)
    order3 = create_order("Ordered", 5, 1)
    order4 = create_order("Paid", 6, 2)
    order5 = create_order("Cancelled", 7, 3)
    order6 = create_order("Cancelled", 7, 3)
    order7 = create_order("Completed", 8, 4)
    login_admin_to_dashboard

    assert page.has_content?("Total Orders: 7")
    assert page.has_content?("Ordered (3)")
    assert page.has_content?("Paid (1)")
    assert page.has_content?("Cancelled (2)")
    assert page.has_content?("Completed (1)")

    click_link "Ordered"
    assert page.has_content?("Order #{order1.id}")
    assert page.has_content?("Order #{order2.id}")
    assert page.has_content?("Order #{order3.id}")
    refute page.has_content?("Order #{order4.id}")
    refute page.has_content?("Order #{order5.id}")
    refute page.has_content?("Order #{order6.id}")
    refute page.has_content?("Order #{order7.id}")

    click_link "Paid"
    refute page.has_content?("Order #{order1.id}")
    refute page.has_content?("Order #{order2.id}")
    refute page.has_content?("Order #{order3.id}")
    assert page.has_content?("Order #{order4.id}")
    refute page.has_content?("Order #{order5.id}")
    refute page.has_content?("Order #{order6.id}")
    refute page.has_content?("Order #{order7.id}")

    click_link "Cancelled"
    refute page.has_content?("Order #{order1.id}")
    refute page.has_content?("Order #{order2.id}")
    refute page.has_content?("Order #{order3.id}")
    refute page.has_content?("Order #{order4.id}")
    assert page.has_content?("Order #{order5.id}")
    assert page.has_content?("Order #{order6.id}")
    refute page.has_content?("Order #{order7.id}")

    click_link "Completed"
    refute page.has_content?("Order #{order1.id}")
    refute page.has_content?("Order #{order2.id}")
    refute page.has_content?("Order #{order3.id}")
    refute page.has_content?("Order #{order4.id}")
    refute page.has_content?("Order #{order5.id}")
    refute page.has_content?("Order #{order6.id}")
    assert page.has_content?("Order #{order7.id}")
  end

  test "admin can click on an order link to view more details" do
    order = create_order("Ordered", 5, 1)
    login_admin_to_dashboard

    assert page.has_link?("Order #{Order.all.last.id}")

    click_link "Order #{Order.all.last.id}"

    assert page.has_content?("Order #{order.id} Details")
    assert page.has_content?
  end

  test "admin can fliter order by order type" do
    skip
    login_admin_to_dashboard
  end

  test "admin can cancel a 'paid' order" do
    skip
    login_admin_to_dashboard
  end

  test "admin can cancel an 'ordered' order" do
    skip
    login_admin_to_dashboard
  end

  test "admin can mark an 'ordered' order as 'paid'" do
    skip
    login_admin_to_dashboard
  end

  test "admin can mark a 'paid' order as 'completed'" do
    skip
    login_admin_to_dashboard
  end

end

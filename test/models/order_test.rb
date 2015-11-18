require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test 'an order belongs to a user' do
    user = create_user
    order = user.orders.create(total_price: 20)

    assert_equal User.all.last.id, order.user_id
  end

  test 'an order has many chip orders' do
    create_shop
    user = create_user
    order = user.orders.create(total_price: 20)
    order.chip_orders.create(chip_id: Chip.all.first.id,
                             quantity: 1, subtotal: 20)
    order.chip_orders.create(chip_id: Chip.all.last.id,
                             quantity: 1, subtotal: 20)

    assert_equal 2, order.chip_orders.all.count
  end

  test "an order can return it's status update links" do
    user = create_user
    order = user.orders.create(total_price: 20)

    expected = ["mark as paid", "cancel"]
    assert_equal expected, order.update_links

    order.status = "Paid"
    expected = ["mark as complete", "cancel"]
    assert_equal expected, order.update_links

    order.status = "Cancelled"
    expected = []
    assert_equal expected, order.update_links

    order.status = "Completed"
    expected = []
    assert_equal expected, order.update_links
  end

  test "an order's status can be changed" do
    user = create_user
    order = user.orders.create(total_price: 20)

    assert_equal "Ordered", order.status
    order.status_update("cancel")
    assert_equal "Cancelled", order.status

    order.status = "Ordered"
    assert_equal "Ordered", order.status
    order.status_update("mark as paid")
    assert_equal "Paid", order.status

    order.status = "Paid"
    assert_equal "Paid", order.status
    order.status_update("mark as complete")
    assert_equal "Complete", order.status

    order.status = "Paid"
    assert_equal "Paid", order.status
    order.status_update("cancel")
    assert_equal "Cancelled", order.status
  end
end

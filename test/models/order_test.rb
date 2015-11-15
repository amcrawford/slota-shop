require 'test_helper'

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
    order.chip_orders.create(chip_id: Chip.all.first.id, quantity: 1, subtotal: 20)
    order.chip_orders.create(chip_id: Chip.all.last.id, quantity: 1, subtotal: 20)

    assert_equal 2, order.chip_orders.all.count
  end
end

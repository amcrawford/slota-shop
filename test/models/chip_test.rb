require 'test_helper'

class ChipTest < ActiveSupport::TestCase
  test 'a chip has many chip orders' do
    create_user
    create_shop
    chip = Chip.all.first
    order = Order.create(total_price: 20, user_id: User.all.first.id)
    order.chip_orders.create(chip_id: chip.id, quantity: 1, subtotal: 20)
    order.chip_orders.create(chip_id: chip.id, quantity: 2, subtotal: 40)

    assert 2, chip.chip_orders.all.count
  end
end

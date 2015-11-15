require 'test_helper'

class ChipTest < ActiveSupport::TestCase
  test 'a chip has many chip orders' do
    create_user
    create_shop
    chip = Chip.all.first
    order = Order.create(total_price: 20, user_id: User.all.first.id)
    order.chip_orders.create(chip_id: chip.id, quantity: 1, subtotal: 20)
    order.chip_orders.create(chip_id: chip.id, quantity: 2, subtotal: 40)

    assert_equal 2, chip.chip_orders.all.count
  end

  test 'a chip can set its slug' do
    Oil.create(name: "Lard")
    chip = Chip.create(name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_id: Oil.all.first)
    assert_equal "dang-coconut", chip.slug
  end
end

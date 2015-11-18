require 'test_helper'

class ChipTest < ActiveSupport::TestCase
  test 'a chip must have a name' do
    chip = Chip.create(price: 10)

    assert_equal 0, Chip.all.count
  end

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
    create_shop
    chip = Chip.find_by(name:"Dang Coconut")
    assert_equal "dang-coconut", chip.slug
  end

  test 'a chip can send its slug to params' do
    create_shop
    chip = Chip.find_by(name:"Dang Coconut")
    assert_equal "dang-coconut", chip.to_param
  end

  test 'a chip can send its description to the right page' do
    create_shop
    chip = Chip.find_by(name:"Dang Coconut")

    assert_equal "Dang, these are good", chip.description_type("show")
    refute_equal "Dang, these are good", chip.description_type("index")
  end
end

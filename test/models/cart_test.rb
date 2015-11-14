require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "a cart can be initialized without data" do
    @cart = Cart.new(nil)
    assert_equal({}, @cart.contents)
  end

  test "a cart can be initialized with a chip" do
    chip = create_chip("Slotachip", 6.99, "yummy")
    create_cart(chip)
    assert_equal({ chip.id.to_s => 1 }, @cart.contents)
  end

  test "a chip can be added to the cart" do
    chip1 = create_chip("Slotachip", 6.99, "yummy")
    chip2 = create_chip("Doritos", 2.99, "cheesy")
    create_cart(chip1)

    assert_equal({ chip1.id.to_s => 1 }, @cart.contents)

    @cart.add_chip(chip2.id.to_s)

    assert_equal({ chip1.id.to_s => 1, chip2.id.to_s => 1 }, @cart.contents)
  end

  test "a chip can be removed from the cart" do
    create_two_chip_cart
    @cart.add_chip(@chip2.id.to_s)

    assert_equal({ @chip1.id.to_s => 1, @chip2.id.to_s => 2 }, @cart.contents)

    @cart.subtract_chip(@chip2.id.to_s)

    assert_equal({ @chip1.id.to_s => 1, @chip2.id.to_s => 1 }, @cart.contents)
  end

  test "if removing a chip from the cart makes the quantity zero, it is removed fro the cart" do
    create_two_chip_cart

    assert_equal({ @chip1.id.to_s => 1, @chip2.id.to_s => 1 }, @cart.contents)

    @cart.subtract_chip(@chip2.id.to_s)

    assert_equal({ @chip1.id.to_s => 1 }, @cart.contents)
  end

  test "cart can return it contents, quantity and subtotal of each chip" do
    create_two_chip_cart
    cart_chip = @cart.cart_chips

    assert_equal "Slotachip", cart_chip[0].name
    assert_equal 1, cart_chip[0].quantity
    assert_equal 6.99, cart_chip[0].subtotal
    assert_equal "Doritos", cart_chip[1].name
    assert_equal 1, cart_chip[1].quantity
    assert_equal 2.99, cart_chip[1].subtotal
  end

  test "cart can return the total price of all it's items" do
    create_two_chip_cart

    assert_equal 9.98, @cart.total
  end

  test "cart can return the total number of items it contains" do
    create_two_chip_cart
    assert_equal 2, @cart.cart_size
  end

  test "cart can return how many of each chip it has" do
    create_two_chip_cart
    @cart.add_chip(@chip2.id.to_s)

    assert_equal 1, @cart.count_of(@chip1.id.to_s)
    assert_equal 2, @cart.count_of(@chip2.id.to_s)
  end

  test "the cart can be emptied" do
    create_two_chip_cart
    assert_equal({}, @cart.clear)
  end
end

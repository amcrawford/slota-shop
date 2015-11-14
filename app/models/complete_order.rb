class CompleteOrder
  attr_accessor :order

  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def create_order
    if @order.save
      create_chip_order
      clear_cart
    else
      # something else
    end
  end

  def create_chip_order
    ChipOrder.create_chip_order(@order, @cart)
  end

  def clear_cart
    @cart.contents.clear
  end
end

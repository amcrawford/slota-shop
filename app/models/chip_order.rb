class ChipOrder < ActiveRecord::Base
  belongs_to :chip
  belongs_to :order

  def self.create_chip_order(order, cart)
    cart.contents.each do |chip_id, quantity|
      chip_price = Chip.find(chip_id.to_i).price
      subtotal = chip_price * quantity
      ChipOrder.create(order_id: order.id,
                       chip_id: chip_id, quantity: quantity, subtotal: subtotal)
    end
  end
end

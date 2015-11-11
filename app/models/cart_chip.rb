class CartChip < ActiveRecord::Base
  def self.find_chips(cart_content)
    chips = {}
    cart_content.each do |chip_id, quantity|
      chips[Chip.find(chip_id)] = quantity
    end
    chips
  end

  def self.find_total(chips)
    total = 0
    chips.each do |chip, quantity|
      total += chip.price.to_i * quantity.to_i
    end
    total
  end
end

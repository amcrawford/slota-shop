class CartChip < ActiveRecord::Base
  def self.find_chips(cart_content)
    chips = {}
    cart_content.each do |chip_id, quantity|
      chips[Chip.find(chip_id)] = quantity
    end
    chips
  end

  def self.chips_total(chips)
    price_hash = {}
    chips.each do |chip, quantity|
      price_hash[chip.id] = chip.price.to_i * quantity.to_i
    end
    price_hash
  end

  def self.find_total(chips)
    total = 0
    chips.each do |chip, quantity|
      total += chip.price.to_i * quantity.to_i
    end
    total
  end
end

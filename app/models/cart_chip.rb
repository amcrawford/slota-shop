class CartChip < ActiveRecord::Base
  def self.find_chips(cart_content)
    chips_id = cart_content.keys
    chips = chips_id.map do |chip_id|
      Chip.find(chip_id)
    end
    chips
  end
end

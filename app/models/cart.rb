class Cart
  attr_reader :contents

  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def cart_chips
    @contents.map do |chip_id, quantity|
      chip = Chip.find(chip_id)
      subtotal = quantity * chip.price
      CartChip.new(chip, quantity, subtotal)
    end
  end

  def total
    cart_chips.reduce(0) { |sum, n| sum + n.subtotal }
  end

  def add_chip(chip_id)
    contents[chip_id.to_s] ||= 0
    contents[chip_id.to_s] += 1
  end

  def subtract_chip(chip_id)
    contents[chip_id.to_s] ||= 0
    contents[chip_id.to_s] -= 1
    if contents[chip_id.to_s] == 0
      contents.delete(chip_id.to_s)
    end
    Chip.find(chip_id)
  end

  def cart_size
    @contents.values.sum
  end

  def count_of(chip_id)
    contents[chip_id.to_s]
  end

  def clear
    @contents = {}
  end

  def add_or_remove_chip(action, chip)
    if action == "add"
      add_chip(chip.id)
    else
      subtract_chip(chip.id)
    end
  end

  def remove_notice?(action)
    action == "subtract"
  end
end

class Cart
  attr_reader :contents

  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_chip(chip_id)
    contents[chip_id.to_s] ||= 0
    contents[chip_id.to_s] += 1
  end

  def subtract_chip(chip_id)
    contents[chip_id.to_s] ||= 0
    contents[chip_id.to_s] -= 1
  end

  def total
    @contents.values.sum
  end

  def count_of(chip_id)
    contents[chip_id.to_s]
  end

  def clear
    @contents = {}
  end
end

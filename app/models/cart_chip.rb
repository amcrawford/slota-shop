class CartChip < SimpleDelegator
  attr_reader :chip, :quantity, :subtotal

  def initialize(chip, quantity, subtotal)
    super(chip)
    @quantity = quantity
    @subtotal = subtotal
  end
end

require 'test_helper'

class OilTypeTest < ActiveSupport::TestCase
  test "an oil type category can be created with valid attributes" do
    oil_type = OilType.new(name: "Lard")

    assert oil_type.valid?
    assert_equal "Lard", oil_type.name
  end

  test "an oil type category can not be created without a name" do
    oil_type = OilType.new()

    assert oil_type.invalid?
  end

  test "an oil type category can not be created without a unique name" do
    oil_type1 = OilType.create(name: "Lard")
    oil_type2 = OilType.new(name: "Lard")

    assert oil_type2.invalid?
  end

  test "a category name is rewritten as an appropriate slug" do
    oil_type = OilType.new(name: "Coconut Oil")

    assert_equal "coconut_oil", oil_type.name_id
  end

  test "a slug is rewritten to it's category name" do
    slug = "coconut_oil"

    assert_equal "Coconut Oil", OilType.storage_name(slug)
  end
end

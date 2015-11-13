# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Oil.create!([{name: "Lard"}, {name: "Coconut Oil"}, {name: "Avocado Oil"}, {name: "Taro Oil"}])

Chip.create!([
  { name: "Grandma Utz Handcooked Potato Chips",
    price: 6.99,
    description: "Whole fresh potatoes, sliced and cooked in lard, with salt added. ",
    oil_id: 1,
    image_file_name: "http://www.getutz.com/media/k2/items/cache/f710044bf79a4b1f5d8b085e5e5d9711_M.jpg"},
  { name: "Jacksons Honest Potato Chips, Sweet Potato",
    price: 4.25,
    description: "Wade with coconut oil. Nature's most nourishing oil. Non GMO
    Project verified. Always kettle cooked in Colorado. Our goal at Jackson's
    Honest Potato Chips is to bring the potato chip back to its humble and simple
    roots by using the finest potatoes available and kettle frying them by hand
    using organic coconut oil.",
    oil_id: 2,
    image_file_name: "https://img.thrivemarket.com/store/566x/8/5/856823004110-1.jpg"},
  { name: "Dang Toasted Coconut Chips",
    price: 10.79,
    description: "Our toasted coconut chips are a delicious snack with all the
    health benefits of coconut oil. They're so good, you'll say Dang! ",
    oil_id: 2,
    image_file_name: "http://images.vitaminimages.com/pp/VF/Assets/Puritan_products/Detail_page/004049.jpg",
    status: "retired" },
  { name: "Grandma Utz Handcooked Potato Chips BBQ",
    price: 6.99,
    description: "Slightly thicker, un-rinsed potato slices, kettle-cooked in
    lard in small batches at the best temperature for perfect crispness. Simply amazing!",
    oil_id: 1,
    image_file_name: "http://www.getutz.com/media/k2/items/cache/0b1ad7a7b79268a1f4558db78e092446_M.jpg"},
  ])


  User.create!([{username: "User", password: "Password"}, {username: "Admin", password: "Password", role: 1}])
  Order.create!([{total_price: 20, user_id: 1}])
  ChipOrder.create!([{chip_id: 1, quantity: 1, subtotal: 20, order_id: 1}])

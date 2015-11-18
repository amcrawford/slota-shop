# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Oil.create!([{name: "Lard"}, {name: "Coconut Oil"}, {name: "Avocado Oil"}])

Chip.create!([
  { name: "Grandma Utz Handcooked Original",
    price: 6.99,
    description: "Whole fresh potatoes, sliced and cooked in lard, with salt added. ",
    oil_id: 1,
    image_file_name: "/utz_lardoriginal.png"},
  { name: "Jackson's Honest Sweet Potato",
    price: 4.25,
    description: "Wade with coconut oil. Nature's most nourishing oil. Non GMO
    Project verified. Always kettle cooked in Colorado. Our goal at Jackson's
    Honest Potato Chips is to bring the potato chip back to its humble and simple
    roots by using the finest potatoes available and kettle frying them by hand
    using organic coconut oil.",
    oil_id: 2,
    image_file_name: "/jacksons_sweetpotato.png"},
  { name: "Dang Toasted Coconut Chips",
    price: 10.79,
    description: "Our toasted coconut chips are a delicious snack with all the
    health benefits of coconut oil. They're so good, you'll say Dang! ",
    oil_id: 2,
    image_file_name: "/dang_coconutchips.png",
    status: "retired" },
  { name: "Grandma Utz Handcooked BBQ",
    price: 6.99,
    description: "Slightly thicker, un-rinsed potato slices, kettle-cooked in
    lard in small batches at the best temperature for perfect crispness. Simply amazing!",
    oil_id: 1,
    image_file_name: "/utz_lardbbq.png"},
  { name: "Boulder Canyon Kettle Cooked Sea Salt",
    price: 3.28,
    description: "Boulder Canyon Foods, an Inventure Foods brand, has expanded
    its kettle-cooked potato chip line with the addition of Coconut Oil Kettle Cooked Potato Chips.",
    oil_id: 2,
    image_file_name: "/BoulderCanyonCoconut900.png"},
  { name: "Boulder Canyon Sea Salt & Pepper",
    price: 3.89,
    description: "What’s better than our avocado oil chips? Adding a zesty pinch of salt combined with a kick of pepper for a perfect snack.",
    oil_id: 3,
    image_file_name: "/bouldercanyon_seasalt.png"},
  { name: "Dang Coconut Chips Bacon",
    price: 4.39,
    description: "Coconut chips are a healthy snack with all the benefits of coconut oil. They're made from the copra (coconut meat), sliced out and toasted with sugar and salt. With abundant protein and fiber, it's okay to become addicted to this versatile snack.",
    oil_id: 2,
    image_file_name: "/dang_bacon.png"},
  { name: "Jackson's Honest Salt and Vinegar",
    price: 4.92,
    description: "Made exclusively with organic potatoes and organic coconut oil and naturally gluten-free. We hope you will enjoy Jackson's Honest Potato Chips as much as we enjoy making them.",
    oil_id: 2,
    image_file_name: "/jacksons_saltandvinegar.png"},
  { name: "Good Health Kettle Chips Sea Salt",
    price: 3.39,
    description: "These small-batch beauties are made with only three simple ingredients - real sliced potatoes, a dusting of sea salt and flavor-rich 100% Avocado Oil, which is known for its antioxidants and heart healthy monounsaturated fats so you can... Enjoy Being Good!",
    oil_id: 3,
    image_file_name: "/goodhealth_avocado.png"}
  ])


  User.create!([{username: "User", password: "Password"}, {username: "Admin", password: "Password", role: 1}])
  Order.create!([{total_price: 20, user_id: 1}])
  ChipOrder.create!([{chip_id: 1, quantity: 1, subtotal: 20, order_id: 1}])

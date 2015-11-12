ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'simplecov'

SimpleCov.start("rails")

class ActiveSupport::TestCase
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def teardown
    reset_session!
  end

  def create_chip(name, price, description)
    Chip.create(name: name, price: price, description: description)
  end

  def create_shop_and_logged_in_user
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    item_2 = Chip.create(name: "Old Chips", price: 20, description: "Super yummy", oil_id: category_1.id, status: "retired")
    user = User.create(username: "John", password: "Password")
    order = user.orders.create(total_price: 20)
    order.chip_orders.create(chip_id: item_1.id, quantity: 1, subtotal: 20)
    order.chip_orders.create(chip_id: item_2.id, quantity: 1, subtotal: 20)

    visit '/'

    click_link "Login"

    fill_in "Username", with: "John"
    fill_in "Password", with: "Password"

    click_button "Login"

    visit orders_path
    click_link("View Order Details")
  end
end

DatabaseCleaner.strategy = :transaction

class Minitest::Spec
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

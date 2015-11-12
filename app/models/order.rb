class Order < ActiveRecord::Base
  has_many :chip_orders
  has_many :chips, through: :chip_orders
  belongs_to :user

end

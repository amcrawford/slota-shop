class Order < ActiveRecord::Base
  has_many :chip_orders
  has_many :chips, through: :chip_orders
  belongs_to :user

  def update_links
    if status == "Ordered"
      links = "[mark as paid] [cancel]"
    elsif status == "Paid"
      links = "[mark as complete] [cancel]"
    else
      links = nil
    end
    links
  end
end

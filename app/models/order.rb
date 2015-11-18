class Order < ActiveRecord::Base
  has_many :chip_orders
  has_many :chips, through: :chip_orders
  belongs_to :user
  validates :total_price, numericality: { greater_than: 0 }
  scope :ordered,       -> { where status: 'Ordered' }
  scope :paid,          -> { where status: 'Paid' }
  scope :cancelled,     -> { where status: 'Cancelled' }
  scope :completed,     -> { where status: 'Completed' }
  scope :desc_by_date,  -> { order(id: :desc) }

  def update_links
    if status == "Ordered"
      links = ["mark as paid", "cancel"]
    elsif status == "Paid"
      links = ["mark as complete", "cancel"]
    else
      links = []
    end
    links
  end

  def status_update(new_status)
    if new_status == "cancel"
      self.status = "Cancelled"
    elsif new_status == "mark as paid"
      self.status = "Paid"
    elsif new_status == "mark as complete"
      self.status = "Complete"
    end
  end

  def size_of_order
    self.reduce(0) { |sum, n| sum + n.subtotal }
  end

  def self.scope_action(scope)
    # Order.send(scope.downcase)
    if scope == "Ordered"
      Order.ordered
    elsif scope == "Paid"
      Order.paid
    elsif scope == "Cancelled"
      Order.cancelled
    else
      Order.completed
    end
  end 
end

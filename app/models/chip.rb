class Chip < ActiveRecord::Base
  belongs_to :oil_type
  has_many :chip_orders
  has_many :orders, through: :chip_orders
  before_save :set_slug
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  scope :available, -> { where(status: "Available").order(name: :desc) }
  scope :admin_alpha, -> { order(status: :asc).order(name: :desc) }

  def to_param
    slug
  end

  def set_slug
    self.slug = name.downcase.gsub(" ", "-")
  end

  def description_type(source)
    if source == "index"
      nil
    elsif source == "show"
      self.description
    else
      self.description
    end
  end
end

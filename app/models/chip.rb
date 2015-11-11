class Chip < ActiveRecord::Base
  belongs_to :oil_type
  before_save :set_slug
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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
      chip.description
    else
      chip.description
    end
  end
end

class Chip < ActiveRecord::Base
  belongs_to :oil_type
  before_save :set_slug

  def to_param
    slug
  end

  def set_slug
    self.slug = name.downcase.gsub(" ", "-")
  end
end

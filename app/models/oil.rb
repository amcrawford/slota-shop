class Oil < ActiveRecord::Base
  has_many :chips
  validates :name, presence: true, uniqueness: true
  before_save :set_slug

  def to_param
    slug
  end

  def set_slug
    self.slug = name.downcase.gsub(" ", "-")
  end

  def gimee_your_chips
    chips.all
  end
end

class Oil < ActiveRecord::Base
  has_many :chips
  validates :name, presence: true, uniqueness: true
  before_save :set_slug

  def to_param
    slug
  end

  def set_slug
    self.slug = name.downcase.tr(" ", "-")
  end

  def gimee_your_chips
    chips.available
  end

  def oil_index_image
    if name == "Avocado Oil"
      "http://i.imgur.com/StaBSGO.jpg"
    elsif name == "Coconut Oil"
      "http://i.imgur.com/gn4vqHt.jpg"
    else
      "http://i.imgur.com/tvZ8urm.jpg"
    end
  end
end

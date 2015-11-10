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
  #
  # def name_id
  #   name.downcase.gsub(" ", "_")
  # end
  #
  # def self.storage_name(downcased_name)
  #   downcased_name.gsub("_", " ").split.map(&:capitalize).join(' ')
  # end


end

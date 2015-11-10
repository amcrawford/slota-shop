class OilType < ActiveRecord::Base
  has_many :chips
  validates :name, presence: true, uniqueness: true

  def name_id
    name.downcase.gsub(" ", "_")
  end

  def self.storage_name(downcased_name)
    downcased_name.gsub("_", " ").split.map(&:capitalize).join(' ')
  end
end

class ThemePark < ActiveRecord::Base
  validates :name, :description, :location, :rating, presence: true
  validates :rating, numericality: {greater_than: 0, less_than: 6}
  has_many :theme_park_images
end

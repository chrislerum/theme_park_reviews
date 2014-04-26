class ThemePark < ActiveRecord::Base
  validates :name, :description, :location, presence: true
  has_many :theme_park_images, dependent: :destroy
  has_many :ratings
  accepts_nested_attributes_for :theme_park_images

  def average_rating
    my_ratings = ratings.pluck(:rating)
    if my_ratings.size > 0
      my_ratings.sum / my_ratings.size
    else
      'N/A'
    end
  end
end

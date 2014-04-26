class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme_park
  validates :rating, presence: true, numericality: {greater_than: 0, less_than: 6}
  validates :user_id, :theme_park_id, presence: true
end

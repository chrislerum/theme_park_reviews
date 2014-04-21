class ThemeParkImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :theme_park
  validates :theme_park_id, :title, presence: true
end

class ThemeParkImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :theme_park
end

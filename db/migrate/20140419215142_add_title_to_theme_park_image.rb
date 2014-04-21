class AddTitleToThemeParkImage < ActiveRecord::Migration
  def change
    add_column :theme_park_images, :title, :string
  end
end

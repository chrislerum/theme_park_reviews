class RemoveRatingFromThemeParks < ActiveRecord::Migration
  def change
    remove_column :theme_parks, :rating
  end
end

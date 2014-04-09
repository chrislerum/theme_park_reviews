class CreateThemeParks < ActiveRecord::Migration
  def change
    create_table :theme_parks do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :rating

      t.timestamps
    end
  end
end

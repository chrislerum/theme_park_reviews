class CreateThemeParkImages < ActiveRecord::Migration
  def change
    create_table :theme_park_images do |t|
      t.integer :theme_park_id
      t.string :photo

      t.timestamps
    end
  end
end

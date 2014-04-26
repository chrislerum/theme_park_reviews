class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true
      t.references :theme_park, index: true
      t.integer :rating

      t.timestamps
    end
  end
end

class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.string :phone1
      t.string :email

      t.timestamps
    end
  end
end

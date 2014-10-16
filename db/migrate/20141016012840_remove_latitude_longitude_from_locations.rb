class RemoveLatitudeLongitudeFromLocations < ActiveRecord::Migration
  def down
    remove_column :latitude, :longitude
  end
end

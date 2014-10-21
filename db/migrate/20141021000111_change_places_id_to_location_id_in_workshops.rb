class ChangePlacesIdToLocationIdInWorkshops < ActiveRecord::Migration
  def change
    rename_column :workshops, :places_id, :location_id
  end
end

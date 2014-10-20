class RemoveDateFromWorkshops < ActiveRecord::Migration
  def change
    remove_column :workshops, :date, :date
  end
end

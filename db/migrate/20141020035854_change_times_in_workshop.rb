class ChangeTimesInWorkshop < ActiveRecord::Migration
  def change
    change_column :workshops, :start_time, :datetime
    change_column :workshops, :end_time, :datetime
  end
end

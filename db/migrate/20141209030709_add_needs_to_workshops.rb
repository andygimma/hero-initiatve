class AddNeedsToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :needs, :text
  end
end

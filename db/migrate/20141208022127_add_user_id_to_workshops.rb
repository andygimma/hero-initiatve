class AddUserIdToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :user_id, :string
  end
end

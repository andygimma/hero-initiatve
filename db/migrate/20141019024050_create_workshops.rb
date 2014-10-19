class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :context
      t.integer :places_id
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end

class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :context
      t.integer :places_id
      t.date :date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

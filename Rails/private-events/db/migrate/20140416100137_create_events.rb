class CreateEvents < ActiveRecord::Migration
  def change
    drop_table :events
    create_table :events do |t|
      t.string :name
      t.date :day
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
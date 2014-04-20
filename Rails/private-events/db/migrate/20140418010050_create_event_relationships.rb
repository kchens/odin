class CreateEventRelationships < ActiveRecord::Migration
  def change
  	drop_table :event_relationships
    create_table :event_relationships do |t|
      t.integer :attended_event_id
      t.integer :attendee_id
     
      t.timestamps
    end
  end
end

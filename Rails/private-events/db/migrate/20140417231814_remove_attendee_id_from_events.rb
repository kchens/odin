class RemoveAttendeeIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :attendee_id, :integer
  end
end

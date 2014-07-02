class AddPassengerToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :passenger, index: true
  end
end

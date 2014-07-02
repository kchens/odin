class AddBookingToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :booking, index: true
  end
end

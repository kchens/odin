class Booking < ActiveRecord::Base
  has_many   :tickets, foreign_key: :booking_id
  has_many   :passengers, through: :tickets
  belongs_to :flight

  accepts_nested_attributes_for :passengers
end

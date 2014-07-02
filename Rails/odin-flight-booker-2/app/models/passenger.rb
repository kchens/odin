class Passenger < ActiveRecord::Base

  has_many  :tickets, foreign_key: :passenger_id
  has_many  :bookings, through: :tickets
  has_many  :flights, through: :bookings
end

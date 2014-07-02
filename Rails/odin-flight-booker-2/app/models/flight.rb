class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  has_many :bookings, foreign_key: :flight_id
  has_many :passengers, through: :bookings

  #in order for the datetime to be called correctly, we need to have an array like so
  def self.flight_dates
    all.map { |f| [f.formatted_date, f.date.to_date] }.uniq
  end

  def self.search(params)
    if params[:search]
      Flight.on_date(params[:date].to_date)
            .where('from_airport_id = ? AND to_airport_id = ?', params[:from], params[:to])
            .includes(:from_airport, :to_airport) # prevents N + 1 queries
    else
      Flight.none
    end
  end

  def self.on_date(date_param)
    where(date: date_param.beginning_of_day..date_param.end_of_day)
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end

end
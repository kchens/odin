class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.flight_dates
    all.map { |f| [f.formatted_date, f.date.to_date] }.uniq
  end

  def self.search(params)
    if params
      puts "in flight.rb"
      puts params      
      Flight.where(from_airport_id: params[:from], to_airport_id: params[:to])
            .on_date(params[:date].to_date)
            # .includes(:from_airport, :to_airport) # prevents N + 1 queries
    else
      Flight.none
    end
  end

  def self.on_date(date_param)
    # elegant solution from: http://stackoverflow.com/questions/2381718/rails-activerecord-date-between
    where(date: date_param.beginning_of_day..date_param.end_of_day)
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end

end
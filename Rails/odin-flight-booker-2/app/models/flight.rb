class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"


  def self.search(params)
    # puts params
    if params
      #1) put a debugger statement and verify that params is nil
      Flight.where(from_airport_id: params[:from], to_airport_id: params[:to])
            .on_date(params[:date].to_date)
            # .includes(:from_airport, :to_airport) # prevents N + 1 queries
    else
      Flight.none
    end
  end

  def self.on_date(date)
    # elegant solution from: http://stackoverflow.com/questions/2381718/rails-activerecord-date-between
    where(start_time: date.beginning_of_day..date.end_of_day)
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end

end

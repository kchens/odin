class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.search(params)
    if params[:search]
      where('from_airport_id = ? AND to_airport_id = ? AND date >= ?', params[:from_airport_id], params[:to_airport_id], params[:date])
    end
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end
end

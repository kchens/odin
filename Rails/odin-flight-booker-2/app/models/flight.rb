class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"


  def self.search(params)
    if params[:search] && !params[:date].blank?
      date = params[:date].to_date
      Flight.where(from_airport_id: params[:from], to_airport_id: params[:to],
                   date: date.beginning_of_day..date.end_of_day)
            .includes(:from_airport, :to_airport)
    else
      Flight.none
    end
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end


end

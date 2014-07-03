class PassengerMailer < ActionMailer::Base
  default from: "kkch3n@gmail.com"

  def thankyou_email(passenger)
    @passenger = passenger
    @booking = @passenger.bookings.last
    @url = "http://localhost:3000/"


    email_with_name = "#{@passenger.name} <#{@passenger.email}>"
    mail(to: @passenger.email, subject: "Thank you for your flight purchase")
  end
end
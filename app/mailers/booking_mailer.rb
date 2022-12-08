class BookingMailer < ApplicationMailer
  def booking_pending_approval_email
    @host = params[:host] 
    @booking = params[:booking]

    mail to: @booking.host.email, subject: "You have a new reservation"
  end
end

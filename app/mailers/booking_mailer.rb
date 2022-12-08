class BookingMailer < ApplicationMailer
  def booking_pending_approval_email
    @host = params[:host] 
    @booking = params[:booking]

    mail to: @booking.host.email, subject: "You have a new reservation"
  end

  def booking_created_email
    @booking = params[:booking]

    mail to: @booking.guest.email, subject: "You have a new booking!"
  end
end

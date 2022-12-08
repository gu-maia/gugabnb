# frozen_string_literal: true

class PaymentMailer < ApplicationMailer
  def booking_payment_approved_email
    @guest = params[:guest]
    @booking = params[:booking]

    mail to: @booking.guest.email, subject: 'Your payment was approved!'
  end

  def booking_payment_denied_email
    @guest = params[:guest]
    @booking = params[:booking]

    mail to: @booking.guest.email, subject: 'Your payment was denied :('
  end
end

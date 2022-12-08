# frozen_string_literal: true

class BookingCreatedNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: 'BookingMailer', method: :booking_created_email

  param :booking
end

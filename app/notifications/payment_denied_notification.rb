# frozen_string_literal: true

class PaymentDeniedNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: 'PaymentMailer', method: :booking_payment_denied_email

  param :booking
end

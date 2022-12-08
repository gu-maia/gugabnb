# frozen_string_literal: true

class PaymentApprovalNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: 'PaymentMailer', method: :booking_payment_approved_email

  param :booking
end

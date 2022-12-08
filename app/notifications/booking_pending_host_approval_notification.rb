class BookingPendingHostApprovalNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "PaymentMailer", method: :booking_pending_approval_email
  
  param :booking
  param :host
end

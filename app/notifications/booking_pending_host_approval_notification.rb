class BookingPendingHostApprovalNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "BookingMailer", method: :booking_pending_approval_email
  
  param :booking
  param :host
end

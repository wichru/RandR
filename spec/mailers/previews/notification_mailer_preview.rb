# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def leave_notification
    NotificationMailer.leave_notification(User.last, Leave.first).deliver_now
  end
end

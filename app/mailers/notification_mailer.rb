class NotificationMailer < ApplicationMailer
  def leave_notification(user, leave)
    @user = user
    @leave = leave

    mail(
      to: "#{user.email}",
      subject: "[RandR] New leave request from #{user.email}"
    )
  end
end

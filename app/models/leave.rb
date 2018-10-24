# frozen_string_literal: true

class Leave < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validates :start_date, date: { before: :end_date, message: 'Start date should be before end date, you moron' }
  after_create :create_notifications
  after_create :send_notifications!

  LEAVE_TYPES = %i[Holiday Unpaid_Leave ElQuatro Maternity Paternity]

  belongs_to :user, optional: true

  def leave_type=(obj)
    if obj.is_a?(String)
      super sanitize_leave_type(obj)
    else
      super
    end
  end

  private

  def sanitize_leave_type(text)
    text.split.map(&:downcase).uniq
  end

  def recipients
    User.admins
  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: user,
                          action: 'posted', notifiable: self)
    end
  end

  def send_notifications!
    recipients.each do |admin|
      NotificationMailer.leave_notification(admin, self).deliver_later
    end
  end
end

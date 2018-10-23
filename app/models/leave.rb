# frozen_string_literal: true

class Leave < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validates :start_date, date: { before: :end_date, message: 'Start date should be before end date, you moron' }
  after_create :create_notifications

  LEAVE_TYPES = %i[Holiday Unpaid_Leave ElQuatro Maternity Paternity]

  belongs_to :user, optional: true

  private

  def recipients
    User.admins
  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: user,
                          action: 'posted', notifiable: self)
    end
  end
end

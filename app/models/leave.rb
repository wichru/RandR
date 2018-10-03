# frozen_string_literal: true

class Leave < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validates :start_date, date: { before: :end_date, message: 'Start date should be before end date, you moron' }

  LEAVE_TYPES = %i[Holiday Unpaid_Leave ElQuatro Maternity Paternity]


  def leave_status
    if @leave.status == true
      'Accepted'
    else
      'Pending'
    end
  end
end

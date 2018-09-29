# frozen_string_literal: true

class Leave < ApplicationRecord
  validates :start_date, :end_date, presence: true

  LEAVE_TYPES = %i[Holiday Unpaid_Leave ElQuatro Maternity Paternity]
end

# frozen_string_literal: true

require 'date'
require 'business_time'

module ApplicationHelper
  def full_name
    current_user.first_name + ' ' + current_user.last_name
  end

  def date_count(type)
    days = @leaves.map do |leave|
      next unless leave.leave_type == type
      monday = Date.parse(leave.start_date.to_s)
      friday = Date.parse(leave.end_date.to_s)
      monday.business_days_until(friday)
    end
    days.sum(&:to_i) if days.sum(&:to_i) != 0
  end
end

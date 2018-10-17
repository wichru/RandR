require 'date'
require 'business_time'

class Holidays

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def date_count(start_date, end_date)
    monday = Date.parse(start_date)
    friday = Date.parse(end_date)
    monday.business_days_until(friday)
  end

  def allowance
    holidays = 26
    holidays - date_count(@start_date, @end_date)
  end
end

testing = Holidays.new('2018-10-10', '2018-10-17')
puts testing.allowance

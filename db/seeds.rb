# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Leave.create(
    start_date: 2018-06-06, end_date: 2018-06-10, leave_type: "Holiday", reason_for_leave: 'ładowane seedem' )
  end

  5.times do
    Leave.create(
      start_date: 2018-10-10, end_date: 2018-10-15, leave_type: "Holiday", reason_for_leave: 'ładowane seedem' )
    end

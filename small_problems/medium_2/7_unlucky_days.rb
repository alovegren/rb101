require "date"
=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Problem
- Given an integer representing a year, return an integer
  - Representing the number of Friday the 13ths in that year

Data Structure
- Date class, date objects
- Range (of days in year)

Algorithm
- Initialize number of days in year
  - if Date at given year is leap, 366
  - otherwise, 365

- Iterate through days in the given year (one to number of days in year)
  - Create a date object where the year is the argument and the ordinal date is the current number in the range
  - if the civil date is 13 and it is a friday, select it

- Return count of selected days

::ordinal
  - argument year, ordinal day
  - returns date object

 ::civil
  - invoked on date object
  - returns date object

#cw day
  - invoked on date object
  - returns num representing day of week (e.g. Monday is 1, Tuesday is 2... Sunday is 7)
=end

# def friday_13th(year)
#   number_days = 365
#   number_days = 366 if Date.new(year).leap?

#   friday_13s = (1..number_days).select do |ordinal_day|
#     current_date = Date.ordinal(year, ordinal_day)
#     current_date.friday? && current_date.day == 13
#   end

#   friday_13s.size
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

=begin

Further Exploration
An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.

Algorithm
- Initialize hash with default value of 0
- Determine whether the given year is a leap year to calculate number of days
- Iterate through the days in the year
  - If the current day is a friday,
    - Add one to the hash value corresponding to the key that is the current day's month
    - e.g. if the current month is January, and it is a Friday, add 1 to the :january value
- Count number of entries in hash for which the value is 5
=end

def five_friday_count(year)
  monthly_friday_count = Hash.new(0)

  number_days = 365
  number_days = 366 if Date.new(year).leap?

  (1..number_days).each do |ordinal_day|
    current_date = Date.ordinal(year, ordinal_day)
    current_month = current_date.month

    monthly_friday_count[current_month] += 1 if current_date.friday?
  end

  monthly_friday_count.count { |_month, qty_fridays| qty_fridays == 5 }
end

p five_friday_count(1988) == 5
p five_friday_count(2020) == 4
p five_friday_count(1900) == 4

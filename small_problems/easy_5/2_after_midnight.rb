# # Problem: Write a method that takes time as a positive or negative integer, where the integer represents the number of minutes after or before midnight, respectively. Return the time in military format.

# Input: Integer
# Output: String

# # Rules
# Explicit:
# - Must be written as a method
# - Must return a string formatted as hh:mm
# - Should work with any integer
# Implicit
# - 0 returns 00:00[
# - May disregard daylight savings and standard time

# # Test Cases

# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03" # EDGE CASE: input under -1440
# time_of_day(3000) == "02:00" # EDGE CASE: input over 1440
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# # Data Structure
# - We want to think about the relationship between minutes and a day and time in hours and minutes. 

# - We can note that time is measured using base 60.  Take the following time of day: 3:42. This represents a time three hours and forty two minutes after midnight (in military time.) Each hour represents sixty minutes, so to determine the amount of minutes past midnight, we multiply (3 * 60) + 42. To solve our problem, we need to perform that calculation backwards.

# (3 * 60) # three hours
#     +42  # remaining minutes
# -------
#     222  # total minutes

# (222 / 60) = 3 remainder 42
#              ^           ^
#            hours      minutes

# Performing simple integer division and using the modulo operator, we can find the hours and minutes. If the given number is negative, we need to adjust it by subtracting its value from 1440, or the amount of minutes in a day. We also need to pay attention to inputs greater than 1440 or less than -1440, for which we must 'start the time over' for each multiple of 24 hours.

# The remaining challenge, then, is to format the time in hh:mm format. If the hour is less than 10, we need to precede the digit in the ones place with a '0'. Same goes for the minutes. Finally, we need to join the strings representing the hours and the minutes with a colon.

# # Algorithm
# - Get the number of hours and minutes
#   - Add input to 1440 if input is negative
#   - Integer division by 60 gives hours
#   - Modulo operator by 60 gives minutes
# - Adjust input if hours > 24
#   - Hours mod 24 gives hours
# - Format the hours and minutes in hh:mm
#   - Write prepend method to check if input is less than 10
#     - Return string prepend with 0 if it is, or string version of input if it isn't
#   - Call prepend method on hours and minutes
#   - Join prepended strings with ':'

def prepend_zero(int)
  final_string = int.to_s
  final_string.prepend('0') if int < 10
  final_string
end

def time_of_day(int)
  (int = 1440 + int) if int < 0
  hours = int / 60
  minutes = int % 60
  hours %= 24

  "#{prepend_zero(hours)}:#{prepend_zero(minutes)}"
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
p time_of_day(-5000)
p time_of_day(5000)
p time_of_day(680)

# We can improve our solution by naming our 1440, 60 and 24 values to make the program clearer.
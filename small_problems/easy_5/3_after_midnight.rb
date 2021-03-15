require 'time'
# # Problem: Write two methods that each take a time of day in hh:mm format, and return the number of minutes before midnight, and the number of minutes after midnight.

# Input: String
# Output: Integer

# # Rules
# Explicit
# - Two methods should be written
# - The methods should return a time in minutes based on the input
# - The value must be in the range 0..1439.
# Implicit
# - The methods should return an integer
# - For both methods, the inputs '00:00' and '24:00' should return 0

# # Test Cases:

# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# # Data Structure
# - This problem is essentially the reverse of the other. Given a string, we want to strip the formatting and save the minutes as the remainder of a modulo operation, and the hours as the result of integer division. We may need to treat 00:00 and 24:00 as edge cases.

# - After Midnight: ((hours * 60) % 1440) + minutes
# - Before Midnight: 1440 - (((hours * 60) % 1440) + minutes)

# # Algorithm
# - Convert string into Integer
#   - Split string into array by ':' 
#   - Return value is array of integers

def get_hours_and_minutes(str)
  hours_and_minutes = str.split(':').map { |elem| elem.to_i }
end

# - Calculate minutes
# - Define after midnight method with one parameter
#   - Assign hours and minutes to array returned by formatting method
#   - Calculate minutes after midnight using formula above

def after_midnight(str)
  hours, minutes = get_hours_and_minutes(str)
  total_minutes = ((hours * 60) % 1440) + minutes
end

# - Define after midnight method with one parameter
#   - Assign hours and minutes to array returned by formatting method
#   - Calculate minutes after midnight using formula above

def before_midnight(str)
  hours, minutes = get_hours_and_minutes(str)
  total_minutes = (1440 - ((hours * 60) + minutes)) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Using the Time class, we can pass in the given string as an argument to Time.new like Time.new(0, 1, 1, 12, 34) to define a Time object at 12:34pm (date is irrelevant for our purposes)

MINUTES_PER_DAY = 1440

def after_midnight(str)
  time = Time.parse(str)
  minutes_in_current_hour = time.hour * 60
  minutes_after_midnight = minutes_in_current_hour + time.min
end

def before_midnight(str)
  time = Time.parse(str)
  minutes_in_current_hour = time.hour * 60
  minutes_before_midnight = (MINUTES_PER_DAY - minutes_in_current_hour - 
                            time.min) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00')# == 0
p after_midnight('12:34') == 754
p before_midnight('12:34')# == 686
p after_midnight('24:00') == 0
p before_midnight('24:00')# == 0
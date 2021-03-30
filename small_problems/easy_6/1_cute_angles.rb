# # Write a method that takes a float parameter, representing an angle between 0 and 360 degrees. The method should return a string representing the angle in degrees, minutes and seconds like so:

# 0°00'00"

# Minutes and seconds are in base 60.

# Input: Float
# Output: String

# # Rules
# - The method should convert a float to a string
# - The string should be formatted in such a way
# - The base 10 decimal system should be converted to a base 60 minutes/seconds system
# - Minutes and seconds always require two digits
#   - That is, use a leading zero if either value is less than ten

# # Examples

# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# # Data Structure
# - We can break up our float numbers into two and then three parts to get each component
# - Dividing and finding the modulus will give us the degrees and a number we can break into minutes and seconds
#   - e.g. 76.73.divmod(1) = [76, 0.730000000000004]
#   -                         |           |
#                          degrees  minutes/seconds
# - Multiplying the modulus by 60 will give us the minutes
#   - e.g. 0.730000000000004 * 60 = 43.800000000000247
#   -                               |
#                                 minutes
# - Multiplying the decimal number excluding the figure in the ones and tens place will give us the seconds
#   - e.g. 0.800000000000247 * 60 = 48.000000000014815
#   -                               |
#                                 seconds
# - We can capture each of these figures in variables, and then format using a built-in method

# # Algorithm
# - Set degrees constant
# - Define a helper method with one parameter
#   - Assign the result of dividing and modding the given Float to variables
#     - (degrees and minutes/seconds)
# - Multiply the minutes/seconds value by 60
# - Divide and mod this result by 1, and capture the two values into minutes and seconds variables
# - Multiply the seconds variable by 60, and floor it to adjust to an Integer value
# - Return an array containing all three significant values

DEGREE = "\xC2\xB0"

def get_angle_figures(flt)
  degrees, minutes_seconds = flt.divmod(1)
  minutes_seconds *= 60
  minutes, seconds = minutes_seconds.divmod(1)
  seconds = (seconds * 60).floor
  [degrees, minutes, seconds]
end

def dms(flt)
  degrees, minutes, seconds = get_angle_figures(flt)
  %(#{degrees}#{DEGREE}#{minutes}'#{seconds}")
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# - Define another, final method
#   - Call the helper method on the given Float, assigning its return value to three variables
#     - variables: degrees, minutes and seconds
#   - Join the degrees, minutes and seconds variables into one string

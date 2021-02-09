def factors(number)
  divisor = number
  factors = []
  begin
while divisor > 0 do
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
end

# 'number % divisor == 0' checks that the number can be divided by the divisor with no remainder. This is a condition for a divisor being a factor of number

# The purpose of line 9 is to make sure the method returns the array factors rather than the evalutation of the previous line which would otherwise be the last line of the method.
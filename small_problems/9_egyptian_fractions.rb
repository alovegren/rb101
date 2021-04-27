=begin

Algorithm
- Enter a loop
  - Initialize accumulator
  - Initialize return array
  - Initialize denominator value to 1
    - Next if the accumulator plus 1/denominator is greater than the given number
    - Add 1/denominator to accumulator
    - Add denominator to array
    - Return array if accumulator is greater than or equal to given number
    - Increment denominator by 1
=end

def egyptian(rtnl)
  denominator_arr = []
  accumulator = 0
  current_denominator = 1
  
  loop do  
    next if accumulator + Rational(1, current_denominator) > rtnl
    accumulator += Rational(1, current_denominator)
    denominator_arr << current_denominator
    current_denominator += 1
    return denominator_arr if accumulator >= rtnl
  end
end

p egyptian(Rational(2, 1))#    # -> [1, 2, 3, 6]
# egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
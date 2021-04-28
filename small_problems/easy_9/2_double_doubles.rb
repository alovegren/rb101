=begin
Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

Problem
- Given an integer, return its double if the integer is not a double number
- A double number is number with an even amount of digits whose left-side and right-side digits are the same
  - e.g 334334 is a double number, 334433 is not
- If the argument is a double number, return the same integer
  
- Input: integer
- Return: possibly a different integer, possibly same one

Data Structure
- Integer
- Convert into a string?

Algorithm
- Is my argument a double number?
  - Convert to string, check for even-numbered size, 
  - Save the two halves of the string (if even-numbered)
  - Check whether two halves are equal
- If not, multiply argument by 2 and return it

- Def method (helper method: returns true if it gets a double number)
  - Convert integer to string, save to variable
  - Slice the string in two if the string's size is even
  - Return true if first/second halves are equal
  - Return false
  
- Main method 
  - Take given integer and pass as argument to helper method (save this value)
  - If my double number status is true, return argument
    - Otherwise, return argument * 2 
    

=end

def double_number?(int)
  string = int.to_s
  midway_pt = string.size / 2
  
  if string.size.even?
    first_half = string[0...midway_pt]
    second_half = string[midway_pt..-1]
    
    return true if first_half == second_half
  end
  false
end
      
def twice(int)
  return int if double_number?(int)
  return int * 2
end
  
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
# # Problem: Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

# # Algorithm:
# - We can use the first method we wrote from the last file-- which will work on strings or arrays-- and we only need to remove the if statement.
# - Instead of incrementing an array whose elements represent the evaluation of the if statement at each iteration, we can use a while loop
# - The while loop will run so long as a condition we set is true
# - If the loop can make it to the end of the array or string with only true values, the function will return true

# Define a method with one parameter
# Initialize a counter variable at zero
# Initialize a status variable to be true
# Start a loop that runs so long as status is true AND the counter is less than the size of the given argument
# - Set our backwards counter equal to the forwards counter minus one, all times negative one
# - Set our status equal to the result of comparing the element at our forwards counter with the element at our backwards counter
# - Increment i by one
# Return the status variable

def palindrome?(str)
  i = 0
  status = true
  while status == true && i < str.size
    b = (i + 1) * (-1)
    status = (str[i] == str[b])
    i += 1
  end
  status
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([[3, 5, 6, 6, 3]]) == true

# The second method still works with strings and arrays without any if, unless or case statements

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([[3, 5, 6, 6, 3]]) == true
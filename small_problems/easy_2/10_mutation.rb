# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# On the first line, we initialize a new variable `array1` and to it, we assign  a areference to an array of strings.
# Next, we initialize `array2` and set it equal to an empty string
# On the third line, we iterate through `array1`
# - For each element in `array1`, we send its value to `array2`
# Next, we iterate through `array1` again.
# - This time, we upcase an element if it starts with 'C' or 'S'

# When `array2` is outputted to the screen, we expect to see:

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# When we iterate through `array1` the first time, we are assigning each element of the array temporarily equal to the parameter `value` with which #each is called. In other words, we are passing references to the original values of the elements of `array1` to the elements of `array2`. While the two arrays do not have the same object IDs, their elements do. 

# So when we call a mutating method on some of the elements of `array1`, we expect to see those same mutations on those elements in `array2`. 
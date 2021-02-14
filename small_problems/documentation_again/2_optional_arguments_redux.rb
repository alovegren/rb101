require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)

# We can deduce that this method ::civil is a class method since it is being called directly on Date. We are going to see why we need to 'require' ::Date before its use, what exactly the method does, what types of arguments it accepts, and what it returns by consulting the Ruby docs.

# (Running the code we see that it accepts at least 3 optional arguments, likely (year, month, date) in integer form, in that order)

# We find the Date page on Ruby-docs which states that it is a subclass of Object. We note that date objects are immutable.

# From the Ruby docs, we see that ::civil creates a date object denoting the given calendar date.
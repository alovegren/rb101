['ant', 'bear', 'caterpillar'].pop.size

# We have two methods chained together in this example so we will inspect the documentation for both.

# First we have #pop called on an array object. Array#pop removes and returns trailing elements: one such element if no argument is given, and n such elements if an Integer argument n is given.

# We expect #pop to return the string 'caterpillar', upon which String#size is called. #size returns the character count of the string, so we expect this code to return the Integer 11.
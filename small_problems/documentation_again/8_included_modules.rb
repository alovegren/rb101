a = [5, 9, 3, 11]
puts a.min(2)

# We navigate to the Array class page in the Ruby 2.3.0 documentation and first search for #min there, which yields no results. Noting the name of the exercise, we scan the sections on the nagivation bars to the left of the page and find that Array has one included module, Enumerable.

# Enumerable does include the method #min and we find there that we can pass it the optional argument 'n' to specify the number of minimum values we want from the Object in Enum.
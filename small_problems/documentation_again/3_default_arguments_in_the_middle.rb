def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# We look to the method invocation page under the core API Ruby doc to find out that we can combine arguments with default values and those without. I'm still confused on this point, but the output ends up being [4, 5, 3, 6]
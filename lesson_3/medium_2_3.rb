def tricky_method(a_string_param, an_array_param)
  # within this method, a_string_param is assigned to "+= rutabaga" and an_array_param is assigned to "<< rutabaga"
  a_string_param += "rutabaga" # String #+= creates a new string object
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]

tricky_method(my_string, my_array)

# The only way for tricky_method() to change the values that my_string and my_array are pointing to outside of the method call is by mutating the caller within the method. += will not mutate the caller, while << will.

puts "I predict my string will be 'pumpkins'."
puts "I predict my array will be ['pumpkins', 'rutabaga']"

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


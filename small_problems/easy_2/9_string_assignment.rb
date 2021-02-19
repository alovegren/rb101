# The following code should print out:

# BOB
# BOB

name = 'Bob' # Here we initialize the variable `name` with a value of 'Bob'
save_name = name # We store the same string object in another variable, `save_name`
name.upcase! # We use a mutating method to permanently alter the string object
puts name, save_name # The string object that both `name` and `save_name` refer to has been altered, so we expect to see that both strings were upcased.
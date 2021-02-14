s = 'abc'
puts s.public_methods.inspect

# Running this code in irb lists all of the public methods available to string objects, including those that would be inherited from BasicObject and Kernel. 

# Locating the #public_methods method on the Object class page of the Ruby documentation, we find that by passing 'false' to the argument 'all' we can access only those in the receiving object. 

# Comparing the size of the returned arrays with without passing 'false', we indeed see a smaller subset of methods:

s.public_methods.size
#  => 183 
s.public_methods(false).size
#  => 128 
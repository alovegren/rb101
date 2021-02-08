# Question 2

# In our studies so far, we understand '!' to mean 'not' or 'caution!', the latter use usually indicating that a method will mutate the caller. '?' seems to always follow a method and indicate that the method checks for a boolean condition. '?' is also part of the syntax for the ternary operator.

# what is != and where should you use it?
  # - != is akin to saying 'not equal to' and should be used as an arithmetic operator; that is, between two pieces of data whose inequality you are testing.
# - put ! before something, like !user_name
  # ! directly before something is akin to saying 'not' and will make truthy values false, and false or nil truthy.
# put ! after something, like words.uniq!
  # - *oftentimes* (but not always!), ! after something indicates that it is a mutating method. The ! in itself is just a naming convention, however, and does not cause a method to be destructive. 
# put ? before something
  # - The something after the '?' would be interpreted as the true condition in a ternary operator.
# put ? after something
  # - This would either be a likely sign that a mehod is checking a boolean condition (again, just a convention) or would indicate that we are using the ternary operator
# put !! before something, like !!user_name
  # - This would be akin to 'not not' which evaluates to 'true'. If it precedes a false value, it would evaluate to 'false'. This has the effect of turning any object into its boolean equivalent.

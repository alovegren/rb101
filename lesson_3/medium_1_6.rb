answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The output will be (42 - 8) or 34. The object stored in the variable 'answer' is not altered within the mess_with_it method invocation.
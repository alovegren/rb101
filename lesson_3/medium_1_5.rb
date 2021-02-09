limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The local variable limit with the stored value 15 is not accessible within the method definition. It must be passed in as an argument upon invocation if Ben wishes to make use of it.
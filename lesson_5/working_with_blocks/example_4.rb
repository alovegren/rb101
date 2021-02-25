my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# Line 1: The result of the code block is assigned to my_arr. #each is called on a two-dimensional array containing two sub-arrays with two elements each. Within the block, each sub-array is assigned to the local variable 'arr'. This method call will return the original object, which is what will be stored in my_arr.
# Line 2: #each is called on the current value of 'arr', which is each Integer element of the current subarray. Within the block, each Integer is assigned to the local variable 'num'. The method call will return the original object, but it won't be used.
# Line 3: A conditional is set using the value stored in 'num'. If 'num' is greater than five, the following line will be evaluated. The if statement has no side effects and its return value will be the expression of its contents, but the value will not be used.
# Line 4: #puts is called on the current value of 'num'. This will output a String representation of the value of 'num' as a side effect. The return value will be nil, but it will not be used by the program.

# We expect to see:
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
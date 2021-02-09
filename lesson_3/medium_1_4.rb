def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size # Array#shift removes and returns the first element in the array
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# In rolling_buffer1 Alyssa is mutating the buffer Array upon which she calls '<<', while in rolling_buffer2 she is pointing the variable buffer to a new place in memory with '+' *within* the method. Outside of the method invocation, buffer1 will have mutated the buffer array while buffer2 would not have done so.
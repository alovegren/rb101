for i in 0..10 do puts "The Flintstones Rock!".rjust(21 + i) end

# We can also do it this way:

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
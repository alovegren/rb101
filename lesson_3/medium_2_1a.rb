# In an attempt to make this example less confusing, we are going to observe only one object as it changes through the method

def fun_with_ids
  a_outer = 42

  a_outer_id = a_outer.object_id # We're assigning a's current object ID to a variable so we can access it later

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts
    # All we have done thus far is initialize a new variable, a_outer_inner_id within a block within the method. We have set that variable equal to the current object ID of a. We are simply pointing two variables to the first object ID.
    puts
    
    a_outer = 22
    # Now we have reassigned a_outer to 22. Since a_outer now contains a different object, it must have a new object_ID.

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts

    a_inner = a_outer
    # We are initializing a new variable, a_inner and setting it equal to the current value of a_outer which is 22. 

    a_inner_id = a_inner.object_id
    # We expect that a_inner_id will be equal to the most recent object ID value output, after a was reassigned to 22.

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts

  # This is where I got tripped up^

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids

puts

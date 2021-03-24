require 'pry'

# # Further Exploration:
# - When the given string is longer than 76 characters (string + 2 spaces and 2 pipes),
#   - The border and spacer lines must print once, at a length of 80 characters
#   - The content line must print as many times as necessary,
#     - in increments of 80 characters,
#     - until the end of the string is reached.
#   - The length of each line must be 80 characters,
#     - meaning that ending content lines will need extra spaces in most cases
# - If the given string is 76 characters or less, the three methods may be called as usual 

# # Algorithm
# - The method definitions can be unchanged
# - Create a constant for the 76 value
MAX_CHARS = 76

def box_edge(num)
  spacer_qty = num + 2

  print '+'
  spacer_qty.times { |_| print '-' }
  print '+'

  print "\n"
end

def box_pad(num)
  spacer_qty = num + 2

  print '|'
  spacer_qty.times { |_| print ' ' }
  print '|'

  print "\n"
end

def box_content(str)
  print '| '
  print str
  print ' |'

  print "\n"
end

# - Alter the final method
# - Initialize a box width variable equal to the size of the string
# - If the given string plus four characters is greater than the terminal window, 
#   - Reassign the box width variable to 76

def print_in_box(str)
  box_width = str.length
  box_width = MAX_CHARS if box_width > MAX_CHARS

# - Call the first border method, passing in the box width variable
# - Call the first spacer method, passing in the box width variable

  box_edge(box_width)
  box_pad(box_width)

# - Initialize a content length variable at the value of the length of the string
# - Start a loop
#   - If the content length is greater than 76,
#     - Call the content method, passing in the string from the first index to the 76th
#     - Subtract 76 from the content length
#   - Otherwise,
#     - Call the content method, passing in the string, left-justified with the box width padstr
#     - Break out of the loop

  content_length = str.length
  
  loop do
    if content_length > MAX_CHARS
      box_content(str[-content_length, MAX_CHARS])
      content_length -= 76
    else
      box_content(str[-content_length, content_length].ljust(box_width))
      break
    end
  end

# - Call the second border method, passing in the box width variable
# - Call the second spacer method, passing in the box width variable

  box_pad(box_width)
  box_edge(box_width)
end

print_in_box('Jack Sprats was a cat,')
print_in_box('whose wife was made of clay.')
print_in_box('He scrounged around, on the town')
print_in_box('every single day.')

print_in_box('')

print_in_box('The problem of automation is not a problem for a family, or even for a company, or even for an industry. The problem of automation is a national problem. McDonald County, West Virginia mined more coal than it ever mined before. And there are more people receiving surplus food packages in McDonald County than in any other county in the United States, and automation did it.')
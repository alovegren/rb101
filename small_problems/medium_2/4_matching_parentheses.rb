=begin

Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

Problem
- Given a string containing open and closed parentheses, return true if the parentheses are properly balanced
  - There must be an equal amount of open and closed parentheses
  - Balanced pairs must begin with open parentheses
    - In other words, if there is ever an excess of closed parentheses, the method should return false
  - Strings containing no parentheses are balanced
- Otherwise, return false

Data Structure
- Array of characters
- Local variable to track status of open/closed parentheses

Algorithm
- Initialize a balance variable to 1
- Iterate through the characters in the string
  - If the balance variable is ever less than zero, return false
  - Add 1 if an '(' is encountered
  - Subtract 1 if an ')' is encountered
- Return true if the balance variable is 0

=end

# def balanced?(str)
#   balance = 0

#   str.chars.each do |char|
#     return false if balance < 0
#     balance += 1 if char == '('
#     balance -= 1 if char == ')'
#   end

#   balance.zero?
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

=begin

Further Exploration
There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

Data Structure
- Hash to map punctuation type to balance, case statement in iteration, last line in method should check if all values in hash are zero, break statement should check if any values are less than 0

Algorithm
- Define hash (two separate ones for marks with open/close distinctions and those without)
  - keys are name of punctuation mark
  - values are initialized to 0

- Iterate thru string
  - Return false if ANY of the open/close hash values drop below 0
  - Case statement
    - Add one if the character is any opening punctuation mark or a double/single quotation mark
    - Subtract one if it is a closing mark
- Check whether open/close have hash values of zero AND non open/close are even numbers
=end

def balanced?(str)
  open_close_punctuation_balances = { parentheses: 0, square_brackets: 0, curly_brackets: 0 }
  same_punctuation_balances = { single_quote: 0, double_quote: 0 }

  str.chars.each do |char|
    return false if open_close_punctuation_balances.values.any? { |value| value < 0 }
    case char
    when '(' then open_close_punctuation_balances[:parentheses] += 1
    when ')' then open_close_punctuation_balances[:parentheses] -= 1

    when '[' then open_close_punctuation_balances[:square_brackets] += 1
    when ']' then open_close_punctuation_balances[:square_brackets] -= 1

    when '{' then open_close_punctuation_balances[:curly_brackets] += 1
    when '}' then open_close_punctuation_balances[:curly_brackets] -= 1

    when "'" then same_punctuation_balances[:single_quote] += 1
    when '"' then same_punctuation_balances[:double_quote] += 1
    end
  end
  
  open_close_punctuation_balances.values.all? { |value| value.zero? } && same_punctuation_balances.values.all? { |value| value.even? }
end

p balanced?('What is this?') == true
p balanced?('What [is]) this?') == false
p balanced?('What ({is} this?') == false
p balanced?('({What} is this\')?') == false
p balanced?('((What)) (is this\")?') == false
p balanced?('Hey!') == true
p balanced?('}Hey!{') == false
p balanced?('What ((is))) up[') == false
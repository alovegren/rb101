# # Problem: Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# # Rules
# Input: two numbers, either may be floats or integers
# Output: Two strings interpolated with the results of calculations with the input

# Explicit requirements:
# - The program must prompt the user for input two times
# - On the first prompt, the program should retrieve the amount of the user's bill
# - On the second prompt, the program should retrieve the amount that the user wishes to tip
# - The program should compute the tip
# - The program should display the amount of the tip and the total bill amount at one time
# Implicit requirements:
# - The inputs should be converted to floats
# - The outputs should be rounded to two decimal places since that is how we format money
# - The outputs should be interpolated into a string

# # Example

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# # Algorithm
# - Create a prompt method to distinguish the program's prompts from the user's inputs
# - Prompt the user for the amount of their bill
#   - Convert the input into a float, then store it into a bill variable
# - Prompt the user for the amount of their tip as a percentage
#   - Convert the input into a float, then store it into a tip variable
# - Calculate the amount of the tip by multiplying 1/100th of the percentage input by the total bill amount
#   - Save this into a tip variable
# - Calculate the total bill amount by adding the tip variable to the bill variable
#   - Save this into a total bill variable
# - Print a string to the screen, interpolating
#   - The amount of the tip
# - Print a string to the screen, interpolating
#   - The total amount of the bill

def prompt(message)
  puts ">> #{message}"
end

prompt("What is the amount of your bill?")
subtotal = gets.chomp.to_f

prompt("How much would you like to tip? Give a percentage.")
tip_percentage = gets.chomp.to_f

tip_amount = (tip_percentage / 100) * subtotal
total_bill = subtotal + tip_amount

tip_prompt = "Your tip is $#{tip_amount.round(2)}."
bill_prompt = "Your bill is $#{total_bill.round(2)}."

prompt(tip_prompt)
prompt(bill_prompt)
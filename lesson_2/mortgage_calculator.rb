# Assignment: mortgage calculator
# Input:          1. loan amount
#                 2. APR (annual percentage rate)
#                 3. loan duration

# Output:         1. monthly interest rate
#                 2. loan duration in months
#                 3. monthly payment

# Example Input:  1. 400_000
#                 2. 2.65%
#                 3. 15 years

# Example Output: 1. Smaller percentage
#                 2. 180
#                 3. $2,695.49

# Define method with four arguments: monthly payment, loan amount, monthly
# interest rate, and loan duration in months
# Define prompt method
# Welcome user
# Prompt user for input and validate each piece of input within a loop
#   -Validate total loan amount (integer or float)
#   -Validate APR (integer or float)
#   -Validate loan duration in years (integer)
# Multiply loan duration in years by twelve to get loan duration in months
# Convert annual percentage rate into monthly interest rate
# Given a complete set of valid input, plug input data into given equation
# Display results
# Bonus: Allow user to edit values?

# START

# SET monthly_payment(loan_amount, monthly_interest, duration_months)
# loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**
# (-duration_months)))

# SET prompt(message)
#   puts ">> #{message}"
# end

# PRINT "Welcome to Mortgage Calculator!"

# WHILE total_loan_amount is not valid
#   PRINT "That is not a valid loan amount. Please enter a number."

# WHILE annual_percentage rate is not valid
#   PRINT "That is not a valid APR. Please enter a percentage."

# WHILE loan_duration_years is not valid
#   PRINT "That is not a valid loan duration. Please enter a number."

# SET loan_duration_months = loan_duration_years * 12
# SET monthly_percentage_rate = annual_percentage_rate / 12

# monthly_payment(total_loan_amount, monthly_percentage_rate,
# loan_duration_months)

# PRINT monthly_percentage_rate
# PRINT loan_duration_months
# PRINT monthly_payment

require "pry"

def prompt(message)
  puts ">> #{message}"
end

def valid?(number)
  (number == number.to_i.to_s) || (number == number.to_f.to_s)
end

def monthly_payment(loan_amount, monthly_interest, duration_months)
  loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**
  (-duration_months)))
end

prompt("Welcome to Mortgage Calculator!")
prompt("To get started, please enter the total amount of your loan.")

total_loan_amount = nil

loop do
  total_loan_amount = gets.chomp
  break if valid?(total_loan_amount)
  prompt("That is not a valid loan amount. Please enter a number.")
end

annual_percentage_rate = nil

prompt("Next, please enter your annual percentage rate.")

loop do
  annual_percentage_rate = gets.chomp
  break if valid?(annual_percentage_rate)
  prompt("That is not a valid APR. Please enter a percentage.")
end
annual_percentage_rate = annual_percentage_rate.to_f / 100

loan_duration_years = nil

prompt("Next, please enter your loan duration in years.")

loop do
  loan_duration_years = gets.chomp
  break if valid?(loan_duration_years)
  prompt("That is not a valid duration. Please enter a number of years.")
end

loan_duration_months = loan_duration_years.to_i * 12
monthly_percentage_rate = annual_percentage_rate / 12
monthly_payment = monthly_payment(total_loan_amount.to_i,
                                  monthly_percentage_rate, loan_duration_months)

prompt("Your monthly interest rate is #{monthly_percentage_rate * 100}%.")
prompt("Your loan duration in months is #{loan_duration_months} months.")
prompt("Your monthly payment is $#{monthly_payment.round(2)}.")

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets
# Kernel.puts(answer) # answer is a parameter passed to the method puts

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
require "pry"

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  integer = number.to_i
  number == integer.to_s # We can refactor into number.to_i.to_s == number
end

operation_msg = ''

def operation_to_message(op)
  operation_msg = case op
                  when '1'
                    'Adding'
                  when '2'
                    'Subtracting'
                  when '3'
                    'Multiplying'
                  when '4'
                    'Dividing'
                  end
  operation_msg
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  number1 = ''

  loop do
    prompt(MESSAGES['what_number'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['not_valid_number'])
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['second_number?'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['not_valid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt(MESSAGES['calculating'])

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(MESSAGES['result'])

  prompt(MESSAGES['another?'])
  answer = gets.chomp
  break unless answer.downcase.start_with? == 'y'
end

prompt(MESSAGES['goodbye'])

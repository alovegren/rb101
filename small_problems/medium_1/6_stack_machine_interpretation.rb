require "pry"
=begin

A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

Problem
- Create a mini stack-and-register programming language
  - The stack is a list of integers, that can be represented as an array in Ruby
    - Removing numbers from the stack is done in a last in, last out way
  - The register is a separate integer from the stack
    - When we give commands to the language, we use the top value in the stack and the one in the register to calculate them 
      - With the exception of 'n', 'PUSH', 'POP' and 'PRINT'

  e.g. Stack: 1  2  3   Register: 4
       Command: ADD -> Stack: 1  2   Register: 7
       Command: 5 ->   Stack: 1  2  5   Register: 7
       Command: SUB -> Stack: 1  2   Register: 2

  e.g. Stack:   Register: 0
       Command: 5 -> Stack    Register: 5
       Command: PRINT -> Stack:  Register: 5 # Output: 5
       Command: PUSH -> Stack:  5   Register:  5
       Command: 3 -> Stack  5    Register:  3
       Command: PRINT -> Stack  5    Register: 3 # Output: 3
       Command: ADD -> Stack:   Register: 8
       Command: PRINT -> Stack:   Register: 8 # Output: 8
       Command: 5 PRINT PUSH 3 PRINT ADD PRINT

Data Structure
- Array, Integers

Algorithm
- Initialize stack to empty array
- Initialize register to 0

- Break input string into array of words
- Iterate through the words
  - Enter a case statement based on the current command
    - If an integer, overwrite register value with integer
    - If 'PUSH', add the register value to the end of the stack array
    - If 'ADD', pop the last value from the stack array, and increment the register value by that last value
    - If 'SUB', pop the last value from the stack array, and decrement the register value by that last value
    - If 'MULT', pop the last value from the stack array, and multiply the register value by that last value
    - If 'DIV', divide the register value by that last value
    - If 'MOD', update the register value with the remainder from dividing it by the last value in the stack
    - If 'POP', pop the last value from the stack array and replace the register value with it
    - If 'PRINT', output the register value

=end

def minilang(str)
  register = 0
  stack = []

  str.split.each do |command|
    case command
    when command.to_i.to_s then register = command.to_i
    when 'PUSH' then stack.push(register)
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT')
# 12

# 4 -> [], 4
# PUSH -> [4], 4
# PUSH -> [4, 4], 4
# 7 -> [4, 4], 7
# MOD -> [4], 3
# MULT -> [], 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


=begin
Further Exploration

Write a minilang program that can evaluate the following expression:

(3 + (4 * 5) - 7) / (5 % 3)

Problem
- Write a program that processes the above expression such that it can be passed to #minilang to return the correct answer
- The method should detect an empty stack
- The method should detect invalid tokens (any input other than the nine above, plus parentheses)
- Return nil if the program runs successfully

e.g. We need to keep in mind the order by which the register number is operated on by the top stack number. The register is subtracted *from*, divided by the stack top, and modded by the stack top

Keeping that in mind we would want division, mod and subtraction to come after adding/multiplying

(3 + (4 * 5) - 7) / (5 % 3) # add 5 to stack, 3 to register, result of 5 % 3 to stack

3 PUSH -> [3], 3
5 -> [3], 5
MOD -> [], 2
PUSH -> [2], 2

Now add 7 to the stack so it can be subtracted from the result of 3 + (4 * 5). Then 3 may be added to the stack, and 4 and 5 can be multiplied together

7 PUSH -> [2, 7], 7
3 PUSH -> [2, 7, 3], 3
4 PUSH 5 -> [2, 7, 3, 4], 5
MULT -> [2, 7, 3], 20

7 may now be subtracted from 20, 3 may be added, and only then can the whole thing be divided by 2

ADD -> [2, 7], 23
SUB -> [2], 16
DIV -> [], 8

Altogether the command would be:

(3 PUSH 5 MOD PUSH) (7 PUSH 3 PUSH (4 PUSH 5 MULT) ADD SUB) DIV PRINT

- So within the confines of parentheses, we have to ensure that subtraction, division, and remainders come last
- Meaning we must add the latter number first to the stack

- Suppose we read backwards the given input as a string separated into words
  - As we read, we construct a final string and a working string
  - When we encounter a closed parentheses, we construct a new working string
    - When we encounter an integer, we push it to the stack
    - When we encounter an operation (* / + - %), we hold it, push the next number to the register, then complete the operation
  - When we encounter an open parentheses, we push the current working string, appended with PUSH to the final string

(3 + (4 * 5) - 7) / (5 % 3) -> [')', '3', '%', '5', '(', '/', ')', '7', '-', ')', '5', '*', '4', '(', '+', '3', '(']

')' -> new working string: ''
'3' -> working string: '3 PUSH'
'%' -> hold = [%]
  '5' -> '3 PUSH 5 MOD'
  - clear hold
'(' -> final string: '3 PUSH 5 MOD PUSH'

'/' -> hold = [/]
')' -> new working string: ''
'7' -> working string: '7 PUSH'
'-' -> hold = [/, -]
')', 





Data Structure
- The stack

Ideas
- Helper method should format a string that can be properly passed to minilang
  - Wait when an open parentheses is detected



- Third helper method for error handling. Invoke it before calling ^

Algorithm
- 


The answer should be 8. This is trickier than it sounds! Note that we aren't asking you to modify the #minilang method; we want you to write a Minilang program that can be passed to #minilang and evaluated.

Add some error handling to your method. In particular, have the method detect empty stack conditions, and invalid tokens in the program, and report those. Ideally, the method should return an error message if an error occurs, and nil if the program runs successfully.

=end
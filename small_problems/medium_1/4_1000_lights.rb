require "pry"
=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Problem
- Begin with n many numbered switches (initialized to 'off'), and go through n rounds
- On each round, toggle every switch which is a multiple of the current round number
 - For n = 6
  e.g. if on round 4, toggle switch 4
  e.g. if on round 2, toggle switches 2, 4 and 6
- Return an array of switches that are left on

Data Structure
- Hash
- Iterate through ranges corresponding to round number and switch number

Algorithm
- Helper 1: create a hash with Integer keys from 1..n
  - values are all initially 'off'

- Create a hash using helper method
- Iterate through a range representing the current round
  - Iterate through the same range representing the current switch
    - If the current switch is a multiple of the current round,
      - Toggle the switch (helper method 2)
  
Helper 2: toggle the current state, passing in the hash value for the switch
 - Return off if on
 - Return on if off

=end

def initialize_switches(n)
  switch_hash = {}

  (1..n).each { |switch_no| switch_hash[switch_no] = 'off' }
  switch_hash
end

def toggle_switch(state)
  return 'off' if state == 'on'
  return 'on' if state == 'off'
end

def flip_switches(num_of_switches)
  switchboard = initialize_switches(num_of_switches)
  
  rounds = (1..num_of_switches)
  switches = (1..num_of_switches)

  rounds.each do |round|
    switches.each do |switch|
      current_state = switchboard[switch]
      toggle = (switch % round == 0)

      switchboard[switch] = toggle_switch(current_state) if toggle
    end
  end

  switchboard.select { |switch, state| state == 'on' }.keys
end

p flip_switches(5)
p flip_switches(10)
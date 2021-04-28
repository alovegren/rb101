=begin

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Problem
- Given three integers, return an uppercase string based on the following
  - The strings 'A'..'F' represent letter grades which correspond to numerical systems, as in school grades
  - The average of the three integers will determine which range the grade falls into
  - The method should return the correct letter grade associated with the range into which the average falls
- Tested values will be between 0 and 100.
- e.g. (70 + 50 + 100) / 3 = 73.33 -> 'C'

Data Structure
- Hash: keys will reference a range, values the grade letter

Algorithm
- Create a hash with range keys and grade letter value, sum the three integers given and find the average, return whichever hash value corresponding to the key containing the average

- Create grade key hash
- Create helper method to return average
  - Add given grades together and divide by number of grades

- Iterate through hash keys
  - Return hash value for the key whose range captures the average
=end

GRADE_LEGEND = { (0...60) => 'F', (60...70) => 'D', (70...80) => 'C', (80...90) => 'B', (90..100) => 'A' }

def get_average(num1, num2, num3)
  (num1 + num2 + num3) / 3
end

def get_grade(num1, num2, num3)
  average = get_average(num1, num2, num3)

  GRADE_LEGEND.keys.each do |range|
    return GRADE_LEGEND[range] if range.include?(average)
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
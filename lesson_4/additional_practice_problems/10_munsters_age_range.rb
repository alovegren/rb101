# Problem

# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# Input: nested munsters hash
#   -In the outer hash, each of the keys are the name of a munster
#   -The value of each key is another hash which contains information about each munsters
# Output: modified munsters hash
#   -The inner hash for each name should include a fourth key-value pair based on the value of the "age" key

# Expected output:

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Algorithm
# -Iterate through the outer key-value pairs, corresponding to the name of each munster
# -Check the value of the 'age' key
#   -If it is within the range 0..17, add a key-value pair stating that the munster is a kid
#   -If it is within the range 18..64, add a key-value pair stating that the munster is an adult
#   -Otherwise, add a key-value pair stating that the munster is a senior

# munsters.each do |name, information|
#   if (0..17).include?(information["age"])
#     information["age_group"] = "kid"
#   elsif (18..64).include?(information["age"])
#     information["age_group"] = "adult"
#   else
#     information["age_group"] = "senior"
#   end
# end

# p munsters

# We can refactor this to not be so repetitive...

munsters.each do |name, information|
  case information["age"]
  when 0..17
    information["age_group"] = "kid"
  when 18..64
    information["age_group"] = "adult"
  else
    information["age_group"] = "senior"

p munsters
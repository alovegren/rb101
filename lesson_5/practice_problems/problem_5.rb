# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

male_ages = munsters.select { |munster| munster["gender"] == "male" }
total_age = male_ages.sum

# Understanding now that we should find a solution which involves passing a block to an iterating method...

total_age = 0

munsters.each_value do |information|
  total_age += information["age"] if information["gender"] == "male"
end

puts total_age
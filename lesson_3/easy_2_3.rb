ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

ages["Marilyn"] = 22
ages["Spot"] = 237

print ages

# We could also use

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
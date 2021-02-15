ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# We find Enumerable#min which has four signatures:

# min → obj # No argument given, returns the minimum object in Enum assuming all Elements can implement <=>

# At this point we consult Object#<=> which shows one signature:

# obj <=> other → 0 or nil

# We see that this operator returns 0 if obj and other are the same object. The signature is a little confusing, because we know additionally that if obj <= other then <=> will return -1 and if obj >= other then <=> will return 1. In fact the documentation does say this a little later on, so we will take it as that.

# min { |a, b| block } → obj # Block argument given. It seems that a block needs to be passed if any element in self cannot implement <=>

# min(n) → array # Integer argument `n` given, returns the minimum n elements as a new, sorted array

# min(n) { |a, b| block } → array # Integer and block arguments given. It seems again that a block needs to be passed if any element in self cannot implement <=>


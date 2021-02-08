flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.delete_if { |name, number| name != "Barney" }

print flintstones

# We can also say

flintstones.assoc("Barney")

# "If the given key is found, returns a 2-element Array containing that key and its value. Returns nil if key is not found."
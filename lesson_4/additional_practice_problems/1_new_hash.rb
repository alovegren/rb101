flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = Hash.new

flintstones.each_with_index do | name, index |
  flintstones_hash[name] = index
end

print flintstones_hash
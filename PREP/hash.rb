# Methods to create Hash-{}
h1 = {}
h2 = Hash.new()

# Setting default value for a hash, so that when we access a key that is not present it returns us the default value
h3 = Hash.new(false)
p(h3['asd']) # Return false

h4 = Hash.new()
h4.default = nil
p(h4['asd'])

# Hash Representation

h1 = {
    'a'=>1,
    'b'=>2,
    'c'=>3,
    'd'=>4,
}

h2 = {
    :a=>1,
    :b=>2,
    :c=>3,
    :d=>4,
}

h3 = {
    a:1,
    b:2,
    c:3,
    d:4,
}

# Accessing the data of the Hash

p(h1['a'])

p(h2[:b])

p(h3[:c])

p(h3.fetch(:d))

# Adding new values, is assigning if the key exists the value is updated
h3[:e] = 5
p(h3.fetch(:e))
puts()

# Keys
p("Keys of a hash: #{h3.keys()}")

# Values
p("Keys of a hash: #{h3.values()}")
puts()

# Iteration
h3.each { |key, value| p("Key:#{key} & Value:#{value}") }
puts()
h3.each_key { |key| p("Key:#{key} & Value:#{h3[key]}") }
puts()
h3.each_value { |value| p("Value:#{value}") }
puts()

# Filtering Hashes
new_hash = h3.select { |k, v| v>=3 } # Returns new hash after filtering
p(new_hash)

new_hash = h3.reject { |k, v| v>=3 } # Returns new hash after filtering
p(new_hash)

puts()

# Convert HASH => ARRAY
# When we convert a hash{k1=>v1, k2=>v2, ...} to an array we will get an array[ [key1, value1], [key2, value2], ...]
array_of_h3 = h3.to_a()
p("When #{h3} is converted to array we get: #{array_of_h3}")

# if we flatten the converted array all we get is one single array like [k1, v1, k2, v2, ...]
p("When we flatten the array #{array_of_h3.flatten()}")


# Updating a hash with map(), takes in \key, value\ as block params
mapped_h1 = h1.map do |key,value|
    [key,value**3]
end

# map returns array & on every iteration the block's return code will be added to array or executed

p("Mapped hash-1 as array: #{mapped_h1}")
puts("Mapped hash-1 converted to hash: #{mapped_h1.to_h()}")
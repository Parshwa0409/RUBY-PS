# Methods to declare an array
arr1 = []

# arr2 = array.new()


# Arrays support -ve indexing
arr = ['GT-650','INT-650','SHOTGUN-650','SUPER METEOR-650']
puts("\nLast element of the array: #{arr[-1]}")


# Array slicing
puts("\nFirst Two 650cc Bikes of RE: #{arr[0,2]}") # return item 0,1 & exclude 2
puts("First Three 650cc Bikes of RE: #{arr.slice(0,3)}") # return item 0,1,2 & exclude 3

# using slice with '!' will do the changes to the same array, whereas just slice() will create copy of the array and do the operation on copy & return the modified-copy of the array, but '!' will exclude the (first,n-1) item.
# slice!(1,4), return full array except (1,2,3) index of that array
dup_arr = ['GT-650','INT-650','SHOTGUN-650','SUPER METEOR-650']
dup_arr.slice!(0,2)
puts("Two Latest 650cc Bikes of RE: #{dup_arr}") # return item 0,1,2 & exclude 3


# length of an array, length()
puts("\nTotal number of 650cc bikes produced by RE: #{arr.length()}")


# Sorting the array
alphabets = ['a','c','d','b']
puts("\nSorted alphabets: #{alphabets.sort()}")
# sort!() will apply the changes to the array itself

# sorting an array like [1,'a',2,'b'] will give error


# reversing the order of an array
puts("\nThe order of production of 650cc bike from RE (latest to oldest): #{arr.reverse()}")
# reverse! will changw thw array itself, therefore "arr.reverse!() === []'SUPER METEOR-650','SHOTGUN-650','INT-650','GT-650']"


# include to check an item in an array
puts("\nIs Bullet-350 a part of 650cc lineup of RE: #{arr.include?('Bullet 350')}")


# fetch(index), to grab an item from an array using index
=begin
    if index is out of bound by conventional accessing we won't get any error but fetch() will throw error
    arr[100] -> no error thrown
    arr.fetch(100) -> error is thrown
=end

puts("\nThe first ever 650cc bike produced by RE was: #{arr.fetch(0)}")

# we can add a err-msg when an error is to be thrown, or even return false
puts(arr.fetch(100,"Index Out Of Bound"))


# take(index), will returm all the elements from '0' to 'index'
puts("\nFirst Two 650cc Bikes of RE: #{arr.take(2)}")

# sample / sample(n), return a ramdom value or n -random values
puts("\nRandom 650cc Bike: #{arr.sample()}")
puts("Two Random 650cc Bikes: #{arr.sample(2)}")


# uniq() / uniq!(), return uniq elemnts from an array
test_arr = [1,1,1,1,2,3,4,5,5,5,6,7,3]
puts("\nUnique elements from the test-array#{test_arr.uniq()}: #{test_arr.uniq()}")

#join("string-joiner")
puts("\nUnique elements from the test-array#{test_arr.uniq()}: #{test_arr.uniq().join(", ")}")



# Filling data in new array
# since only 0, 3, 6 are filled positions 1,2,4,5 will be nil / empty
arr1[0]=1
arr1[3]=1
arr1[6]=1

puts("\nPrinting the array which is filled manually:")
puts(arr1)

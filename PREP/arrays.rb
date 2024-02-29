# Methods to declare an array
arr1 = []

# arr2 = array.new()


# Arrays support -ve indexing
arr = ['GT-650','INT-650','SHOTGUN-650','SUPER METEOR-650']
puts("\nLast element of the array: #{arr[-1]}")


# Array slicing
puts("\nFirst Two 650cc Bikes of RE: #{arr[0,2]}") # return item 0,1 & exclude 2


# length of an array, length()
puts("\nTotal number of 650cc bikes produced by RE: #{arr.length()}")


# Sorting the array
alphabets = ['a','c','d','b']
puts("\nSorted alphabets: #{alphabets.sort()}")

# sorting an array like [1,'a',2,'b'] will give error


# reversing the order of an array
puts("\nThe order of production of 650cc bike from RE (latest to oldest): #{arr.reverse()}")


# include to check an item in an array
puts("\nIs Bullet-350 a part of 650cc lineup of RE: #{arr.include?('Bullet 350')}")

# Filling data in new array
# since only 0, 3, 6 are filled positions 1,2,4,5 will be nil / empty
arr1[0]=1
arr1[3]=1
arr1[6]=1

puts("\nPrinting the array which is filled manually:")
puts(arr1)


# 
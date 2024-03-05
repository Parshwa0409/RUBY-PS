# Problem Statement: (Parshwa)
# Given an array of strings, write a program that performs the following tasks:


students = ["Parshwa", "Manikanta", "XYZ", "bcd", "fgh", "bbbbccccdddd", "bbbcccddd", "bbccdd", "pathiksha", "lezz"]

# 1. Filters out any strings that do not contain at least one uppercase letter and  one Vowel
result = students.reject {|student| !student.match?(/[aeiouA-Z]+/)}


# 2. Transforms the remaining strings by reversing them.
result.map! { |str| str.reverse! }


# 3. Sorts the strings in ascending order based on their length.
result = result.sort { |a, b| a.length <=> b.length }


# 4. Finally, join the first 3 strings and print the single string after joining, with space between them.
result.each_with_index { |el, i| print (i<3)? "#{el}":"   #{el}" }


# ONE LINER
puts()
students.reject { |student| !student.match?(/[aeiouA-Z]+/) }.map{|str| str.reverse! }.sort { |a, b| a.length <=> b.length }.each_with_index { |el, i| print (i<3)? "#{el}": "  #{el}" }
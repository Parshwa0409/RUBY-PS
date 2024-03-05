# Problem Statement: (Parshwa)
# Given an array of strings, write a program that performs the following tasks:
# 1.	Filters out any strings that do not contain at least one uppercase letter and  one Vowel 
# 2.	Transforms the remaining strings by reversing them.
# 3.	Sorts the strings in ascending order based on their length.
# 4.	Finally, join the first 3 strings and print the single string after joining, with space between them.


students = ["Parshwa", "Manikanta", "XYZ", "bcd", "fgh", "bbbbccccdddd", "bbbcccddd", "bbccdd", "pathiksha", "lezz"]

students.select {|student| !student.match?(/[aeiouA-Z]+/)}.map!{|str|str.reverse!}.sort { |a, b| a.length <=> b.length }.each_with_index do |el, i|
    if(i<3)
        print "#{el}"
    else
        print " <> #{el}"
    end
end

# res.map! do |str|
#     str.reverse!
# end

# res = res.sort { |a, b| a.length <=> b.length }

# p res

# res.each_with_index do |el, i|
#     if(i<3)
#         print "#{el}"
#     else
#         print " <> #{el}"
#     end
# end
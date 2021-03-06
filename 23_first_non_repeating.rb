# Find the first non-repeated character
# Difficulty: medium

# String methods are an incredibly powerful way to 
# validate and control user input.

# Write a method that will find the first non-repeated 
# character in a String. 
# Return false if only repeats are found. 

# *Try writing this by hand first*. 
# Confusing methods like this can become a lot more simple after 
# they are written by hand. 


#*E.g.* first-non-repeat("aaaabbbcccdeeefgh") should return 'd'

#*E.g.* first-non-repeat("wwwhhhggge") should return 'e'

#*E.g.* first-non-repeat("wwwhhhggg") should return false


## Optional
# If given a long string, this would take a fair chunk of computing power, 
# as it would have to go over every character. Can you return on the first 
# non-repeat, without checking every other letter?

# def first_non_repeating(input)
#     # Your code goes here
#     # Split string into array of individual characters
#     input_arr = input.downcase.chars 
#     # Identify unique characters
#     input_arr_unique_elements = input_arr.uniq
#     # Iterate through string array, checking each unique letter and counting it
#     input_arr_unique_elements.each do |x|
#         unique_element_count = input_arr.count(x)
#         if unique_element_count == 1
#             return x
#         end
#     end
#     return false
# end

def first_non_repeating(input)
    input_arr = input.downcase.chars
    while input_arr.length > 0 do
      input_arr.each do |x|
        element_count = input_arr.count(x)
        if element_count > 1
            input_arr.delete(x)
            break
        elsif element_count == 1
            return x
        end
      end
    end
    return false
end

# Test your code here
puts first_non_repeating("aaaabbbcccdeeefgh")
puts first_non_repeating("wwwhhhggge")
puts first_non_repeating("wwwhhhggg")
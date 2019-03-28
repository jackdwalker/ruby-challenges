# Isogram
# Difficulty: medium

# An isogram is a word that has no repeatting letters; 
# consecutive or non-consecutive.

# Implement a method that determines whether a string 
# that contains only letters is an isogram. 
# The function will take the string as input, and will 
# return either true or false.


# *E.g.* isogram?("hello") should return false

# *E.g.* isogram?("scary") should return true

def isogram?(input)
    # Your code goes here
    # Input downcased to arr
    input_arr = input.downcase.chars
    # Iterate through array and check whether there are any repeating letters within that array
    while input_arr.length > 0 do
        input_arr.each do |char|
            element_count = input_arr.count(char)
            # If repeating letters return false
            if element_count > 1
                return false
            elsif element_count == 1
                input_arr.delete(char)
            end 
        end
    end
    # If repeating letters return true
    return true
end

# Test your code here
puts isogram?("hello") #should return false
puts isogram?("scary") #should return true

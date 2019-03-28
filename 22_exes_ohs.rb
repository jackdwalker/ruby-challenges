# Exes and Ohs
# Difficulty: medium/hard

# This is a great question for interview prep, so lets not google it. 
# Instead, try whiteboarding, and thinking of your approach before coding. There are multiple approaches to this question, so try to think of the most efficient one you can!

# Write a method that will take a string as an input. 
# The method will check this string, and count the amount 
# of 'x's and 'o's. It should return true if the amount of 'x's 
# and 'o's are the same, and should return false if they are different. 
# It should also be case insensitive, and work with any set of two 
# characters (for example, the string could contain "oooxxx" or
# "eeefff" - both of these would return true because there are
# two distinct characters and an equal number of each in both
# examples).

# Example input: "ooxx"
# Expected output: true

# Example input: "oOxXxoX"
# Expected output: false

# Example input: "ooXx"
# Expected output: true

# Example input: "rtrt"
# Expected output: true

# Example input: "RtrT"
# Expected output: true

# Example input: "efefy"
# Expected output: false

def exes_and_ohs(input)
    # Your code goes here
    if input.is_a?(String)
        input_arr = input.downcase.chars
        unique_arr_items = input_arr.uniq
        if unique_arr_items.size % 2 != 0
            return false
        end
        (input_arr.count(unique_arr_items[0]) == input_arr.count(unique_arr_items[1])) ? true : false
    else
        puts "Your input was not a string"
        return false
    end
end

# What's the difference? index_acc_count == index_acc+=1_count
# index_acc_count = 

# index_"#{acc}"_count

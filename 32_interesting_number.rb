# Interesting number

# An interesting number is one with at least 3 digits,
# in which the digits are either incrementing or decrementing.

# Examples:
# interesting_number(789) => true
# interesting_number(321) => true
# interesting_number(798) => false
# interesting_number(6) => false
# interesting_number(23) => false

# When the digits are incrementing, 0 comes after 9:
# interesting_number(7890) => true
# When the digits are decrementing, 0 comes after 1:
# interesting_number(3210) => true

def interesting_number(number)
    # your code goes here
    number_arr = number.digits.reverse

    # Method 1 (won't work with zeroes) > iterate over each element checking for two consecutive greater thans:

    number_arr.each_with_index do |digit, index|
        if number_arr.length < 3
            return false
        elsif (digit > number_arr[index + 1] && digit > number_arr[index + 2]) or (digit < number_arr[index + 1] && digit < number_arr[index + 2])
            return true
        end
        return false
    end
    

    # Method 2 > Case statement with zeroes in condition:
    # number_arr.each_with_index do |digit, index|
    #     if number_arr.length < 3
    #         return false
    #     end
        
        
end

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

    return false unless number_arr.length >= 3
    
    return true if (number_arr.each_cons(2).all? { |a, b| b == a - 1 }) or (number_arr.map!{|x| x == 0 ? x = 10 : x}.each_cons(2).all? { |a, b| b == a + 1 })
    
    return false
    
end

interesting_number(890)
# Digital root

# The digital root (also repeated digital sum) of a 
# non-negative integer is the (single digit) value 
# obtained by an iterative process of summing digits, 
# on each iteration using the result from the previous 
# iteration to compute a digit sum. 
# The process continues until a single-digit number is reached.

# For example, the digital root of 65,536 is 7, 
# because 6 + 5 + 5 + 3 + 6 = 25 and 2 + 5 = 7.

# Your code should return the digital root of any positive
# number passed in. 
# You can assume the argument given is an integer.
# Return -1 if any negative argument is provided.

def digital_root(number)
    # Your code goes here
    
    if number < 0
        return -1
    end

    while number >= 10
        number = number.digits.reverse.reduce(:+)
    end

    return number

end

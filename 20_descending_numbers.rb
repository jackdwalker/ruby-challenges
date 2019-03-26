# Background
# Using array and string methods
# Passing in one argument

## Specs

#Your task is to make a function that can take any 
#non-negative integer as a argument and return it 
#with its digits in descending order. 
#Essentially, rearrange the digits to create 
#the highest possible number.

#Examples:
#Input: 21445 Output: 54421
#Input: 145263 Output: 654321
#Input: 1254859723 Output: 9875543221

def descending_order(n)
    # Your code goes here

    if n.is_a?(Integer) and n > 0
        puts n.digits.sort.reverse.join
    elsif n.is_a?(Integer) and n <= 0
        puts "Please enter a positive integer"
    else 
        puts "Please enter an integer as the method parameter"
    end
end

# Test your code here
descending_order(1)
descending_order(21445)
descending_order(145263)
descending_order(1254859723)
descending_order(-1)
descending_order(0)
descending_order("some string")
descending_order(true)
# Add some interesting test cases that test edge cases
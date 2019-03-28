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

# def descending_order(n)
#     # Your code goes here

#     if n.is_a?(Integer) and n > 0
#         puts n.digits.sort.reverse.join
#     elsif n.is_a?(Integer) and n <= 0
#         puts "Please enter a positive integer"
#     else 
#         puts "Please enter an integer as the method parameter"
#     end
# end

# # Test your code here
# descending_order(1)
# descending_order(21445)
# descending_order(145263)
# descending_order(1254859723)
# descending_order(-1)
# descending_order(0)
# descending_order("some string")
# descending_order(true)
# # Add some interesting test cases that test edge cases

#____________
#recursive pure arithmatic
#____________
#length of a base10 number counting from 0
def length n
    Math.log10(n).floor 
end

# 

# Reduces an integer to its first digit eg. 321 #=> 3
def get_first_digit n 
    n / 10**length(n) 
end

# Round integer to 1 significant figure  eg. 321 #=> 300
def round_1_sig_fig n 
    get_first_digit(n) * 10**length(n)
end

# Drops fist digit off an integer eg. 321 #=> 21
def drop1 n 
    n - round_1_sig_fig(n)
end

# single pass of a bubble sort (comb through once)
def comb n
    #if integer has more than 1 digit 
    # p n
    if n >= 10
        #if the  first digit is less than the second digit of the integer
        if get_first_digit(n) < get_first_digit(drop1(n))
        #switch first and second digits, continue combing
        (round_1_sig_fig(drop1(n)) * 10) + comb( (round_1_sig_fig(n) / 10) + drop1(drop1(n)) )
        else
        #digits are in correct positions, contiune combing
        round_1_sig_fig(n) + comb(drop1(n))
        end
    else
        #last digit reached, comb finshed.
        n
    end

end

def sort n
# if a combing over n equals n then the sorting is complete, else continue sorting (combing through)
comb(n) == n ? n : sort(comb(n))
end


# alias 
def descending_numbers n  
sort n
end

huge_int = 543275398574357847652574398

p descending_numbers huge_int

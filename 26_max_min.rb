# Max Min In String

# There are plenty of incredible array methods built into 
# ruby that allow us to compare and run calculations on 
# arrays full of numbers. Sometimes, we don't receive these 
# numbers in an array, and instead receive it as a string of 
# space seperated numbers.

# Write a method that will take a string of space seperated 
# numbers as input, and return the highest and lowest number 
# from this string.

# *E.g.* max_min_in_string("5 2 9 8 23 1") should return "23 1"
# *E.g.* max_min_in_string("15 4 4 38 -9") should return "38 -9"

# Write your own test file for this challenge using Test::Unit


def max_min(num_string)
    # your code goes here
    num_string_minmax_out = num_string.split(" ").map!{ |x| x.to_i }.minmax.reverse.map!{ |x| x.to_s }.join(" ")
end

p max_min("5 2 9 8 23 1")
p max_min("15 4 4 38 -9")

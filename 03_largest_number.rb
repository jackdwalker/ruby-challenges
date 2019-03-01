# Write a method that will take two numbers,
# and return whichever is the largest.
#
# Example:
# largest_number(100,50) should return 100
# largest_number(10,20) should return 20
#
# Check your solution by filling in the folowing table:
# number_1 || number_2 || expected || actual
# 
# If your stuck try working togeather
# 
# Beast Mode:
# If you complete the challenge, feel free to come up
# with your own examples and test corner cases.
# 
# Examples - what if both numbers are equal or are strings?

def largest_number (number_1, number_2)
  # Your code here
  if !number_1.is_a?(Numeric) or !number_2.is_a?(Numeric)
    puts "One of these is not an integer, try again with valid input"
  elsif number_1 > number_2
    puts "#{number_1}"
  elsif number_1 < number_2
    puts "#{number_2}"
  elsif number_1 = number_2
    puts "Both numbers input are the same."
  end
end

largest_number(100,50)
largest_number(10,20)
largest_number("hi", "bye")
largest_number("hi", 12)
largest_number(13, "bye")
largest_number(13.5, 12)
largest_number(12, 12)
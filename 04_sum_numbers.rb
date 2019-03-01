# Sum Numbers

# Write a method that will take an array of numbers,
# and return their sum.

# Example:
# sum_numbers([1,1,1]) should return 3
# sum_numbers([5,2,100,0,10]) should return 117

# Check your solution by running the tests:
# ruby tests/04_sum_numbers_test.rb

# OPTIONAL:
# Go to the tests folder and open 04_sum_numbers_test.rb.
# Read over the tests and see if you can understand them.

# Try add at least three more tests, and test at least 2 corner cases.

# Hint:
# You could test what happens when you call sum_numbers([])?

# Expecting the output to be zero as the sum of nothing is zero

def sum_numbers(numbers)
  # Your code here
  sum = 0
  # If numbers is not an array will return true and ask for a user for
  # valid input
  if !numbers.is_a?(Array)
    # Needs to be assigned to sum to still print and return nil
    # as would be expected of puts, otherwise return sum will evaluate
    # to 0 instead, which wouldn't allow distinction from an sum of
    # numbers that was equal to zero, and an invalid input
    sum = puts "Please give me a set of numbers."
  else numbers.each do |num|
      sum += num
      end
    puts "The sum of #{numbers} is #{sum}"
  end
  return sum
end

sum_numbers([1,1,1])
sum_numbers([5,2,100,0,10])
sum_numbers([5.1, 3.2, 11.6, 9.6, 12])
sum_numbers("hello")
sum_numbers(1)
sum_numbers([])





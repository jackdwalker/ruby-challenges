# Vowels

# Write a method that will take a string and
# return an array of vowels used in that string.

# Example:
# count_vowels("The quick brown fox") should return ["e","u","i","o","o"]
# count_vowels("Hello World") should return ["e","o","o"]

# Check your solution by running the tests:
# ruby tests/09_vowels_test.rb

def vowels (string)
  # Your code here
  # String to characters array
  string_arr = string.chars
  output_arr = []
  # Iterate through array, case statement for vowels, add to a vowels_arr
  string_arr.each do |char|
    case char
    when "a", "e", "i", "o", "u"
      output_arr << char
    when "A", "E", "I", "O", "U"
      output_arr << char
    end
  end
  return output_arr
end

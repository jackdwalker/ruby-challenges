# Methods

# Write a method called 'in_array' which will take 
# two parameteres:
# One as a string and one as an array of strings

# Return a boolean indicationg whether or not the
# string is found in the array.

# Test your solution with:
# ruby tests/05_in_array_test.rb

# Example:
# "hello", ["hi","howdy","hello"] should return true.

# Defining method to check validity of string being in array
# and string being
def in_array(needle, haystack)
  (string_in_array(needle, haystack) == true and needle.is_a? String) ? true : false  
end

def string_in_array(needle, haystack)
    if haystack.include?(needle)
      return true
    end
  return false
end

# Beast Mode:

def in_array(needle, haystack)
  if string_in_array(needle, haystack) == true and needle.is_a? String
    return true
  else
    return false
  end
end 

def string_in_array(needle, haystack)
  haystack.each do |item|
    if needle == item
      return true
    end
  end
  return false
end

# Redo the challenge but try solving it again in a different way.
# Included Once
#
# Write a method that takes an array and a string. Return
# true if the string is found in the array only once.
# Otherwise return false.
#
# What's the time complexity of your solution? Can it be improved?
#
# *** Whiteboard this first ***
#
# Difficulty: 4/10
#
# Example:
# includedOnce(['hello','hi','hi'], 'hi') -> false
# includedOnce(['hello','hi','hey'], 'hi') -> true
#
# Check your solution by running the tests:
# ruby tests/07_included_once_test.rb
#

# Define accumulator, iterate over array, every time |var| is equal to needle
# increment accumulator. If acc = 1 at end of function return true, else
# return false

def included_once (haystack, needle)
  acc = 0
  haystack.each do |word|
    if word == "#{needle}"
      acc += 1
    end
  end
  if acc == 1
    puts "True"
    return true
  else
    puts "False"
    return false
  end
end

included_once(['hello','hi','hi'], 'hi')
included_once(['hello','hi','hey'], 'hi')



